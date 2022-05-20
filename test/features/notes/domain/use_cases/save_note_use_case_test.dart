import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';
import 'package:looping_diary/features/notes/domain/use_cases/save_note_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_mocks.dart';
import '../../../../test_setup.dart';

void main() {
  late NotesRepository mockedNotesRepository;
  late SaveNoteUseCase saveNoteUseCase;

  setUpAll(baseSetup);
  tearDownAll(baseTearDown);

  setUp(() {
    mockedNotesRepository = MockNotesRepository();
    saveNoteUseCase = SaveNoteUseCase(mockedNotesRepository);
  });

  test(
    'should return Right(null) and correctly delegate call to NotesRepository on a successful call',
    () async {
      // arrange
      when(() => mockedNotesRepository.saveNote(captureAny())).thenAnswer((_) async => const Right(null));

      // act
      final result = await saveNoteUseCase(tNote);

      // assert
      expect(result, const Right(null));
      verify(() => mockedNotesRepository.saveNote(tNoteDTO)).called(1);
      verifyNoMoreInteractions(mockedNotesRepository);
    },
  );

  test(
    'should return Left(ServerFailure) on an unsuccessful call',
    () async {
      // arrange
      when(() => mockedNotesRepository.saveNote(captureAny())).thenAnswer(
        (_) async => const Left(tServerFailure),
      );

      // act
      final result = await saveNoteUseCase(tNote);

      // assert
      expect(result, const Left(tServerFailure));
      verify(() => mockedNotesRepository.saveNote(tNoteDTO)).called(1);
      verifyNoMoreInteractions(mockedNotesRepository);
    },
  );
}
