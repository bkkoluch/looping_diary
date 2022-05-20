import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';
import 'package:looping_diary/features/notes/domain/use_cases/get_all_notes_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_mocks.dart';

void main() {
  late GetAllNotesUseCase getAllNotesUseCase;
  late NotesRepository notesRepository;

  setUpAll(() {
    notesRepository = MockNotesRepository();
    getAllNotesUseCase = GetAllNotesUseCase(notesRepository);
  });

  test(
    'should return list of Notes on a successful call',
    () async {
      // arrange
      when(() => notesRepository.getAllNotes()).thenAnswer((_) async => const Right([tNoteDTO]));

      // act
      final result = await getAllNotesUseCase.call();

      // assert
      result.fold(
        (_) => null,
        (notes) {
          verify(() => notesRepository.getAllNotes());
          expect(const ListEquality().equals(notes, [tNote]), isTrue);
        },
      );
    },
  );

  test(
    'should return an empty list on a successful call when repository returns an empty list',
    () async {
      // arrange
      when(() => notesRepository.getAllNotes()).thenAnswer((_) async => const Right([]));

      // act
      final result = await getAllNotesUseCase.call();

      // assert

      result.fold(
        (_) => null,
        (notes) {
          verify(() => notesRepository.getAllNotes());
          expect(const ListEquality().equals(notes, List<Note>.empty()), isTrue);
        },
      );
    },
  );

  test(
    'should return an error if the call is unsuccessful',
    () async {
      // arrange
      when(() => notesRepository.getAllNotes()).thenAnswer((_) async => const Left(tServerFailure));

      // act
      final result = await getAllNotesUseCase.call();

      // assert
      verify(() => notesRepository.getAllNotes());
      expect(result, const Left(tServerFailure));
      verifyNoMoreInteractions(notesRepository);
    },
  );
}