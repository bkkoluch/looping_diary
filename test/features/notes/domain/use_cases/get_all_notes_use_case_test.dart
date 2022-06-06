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
      // Arrange
      when(() => notesRepository.getAllNotes()).thenAnswer((_) async => const Right([tNoteDTO]));

      // Act
      final result = await getAllNotesUseCase.call();

      // Assert
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
      // Arrange
      when(() => notesRepository.getAllNotes()).thenAnswer((_) async => const Right([]));

      // Act
      final result = await getAllNotesUseCase.call();

      // Assert

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
      // Arrange
      when(() => notesRepository.getAllNotes()).thenAnswer((_) async => const Left(tServerFailure));

      // Act
      final result = await getAllNotesUseCase.call();

      // Assert
      verify(() => notesRepository.getAllNotes());
      expect(result, const Left(tServerFailure));
      verifyNoMoreInteractions(notesRepository);
    },
  );

  test(
    'should return Left(NoConnectionFailure) when there\'s no connection',
    () async {
      // Arrange
      when(() => notesRepository.getAllNotes()).thenAnswer((_) async => const Left(tNoConnectionFailure));

      // Act
      final result = await getAllNotesUseCase.call();

      // Assert
      verify(() => notesRepository.getAllNotes());
      expect(result, const Left(tNoConnectionFailure));
      verifyNoMoreInteractions(notesRepository);
    },
  );
}
