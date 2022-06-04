import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';
import 'package:looping_diary/features/notes/domain/use_cases/delete_note_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_mocks.dart';
import '../../../../test_setup.dart';

void main() {
  late NotesRepository mockedNotesRepository;
  late DeleteNoteUseCase deleteNoteUseCase;

  setUpAll(baseSetup);
  tearDownAll(baseTearDown);

  setUp(() {
    mockedNotesRepository = MockNotesRepository();
    deleteNoteUseCase = DeleteNoteUseCase(mockedNotesRepository);
  });

  test(
    'should return Right(null) and correctly delegate call to NotesRepository on a successful call',
    () async {
      // Arrange
      when(() => mockedNotesRepository.deleteNote(captureAny())).thenAnswer((_) async => const Right(null));

      // Act
      final result = await deleteNoteUseCase(tNote);

      // Assert
      expect(result, const Right(null));
      verify(() => mockedNotesRepository.deleteNote(tNoteDTO)).called(1);
      verifyNoMoreInteractions(mockedNotesRepository);
    },
  );

  test(
    'should return Left(ServerFailure) on an unsuccessful call',
    () async {
      // Arrange
      when(() => mockedNotesRepository.deleteNote(captureAny())).thenAnswer(
        (_) async => const Left(tServerFailure),
      );

      // Act
      final result = await deleteNoteUseCase(tNote);

      // Assert
      expect(result, const Left(tServerFailure));
      verify(() => mockedNotesRepository.deleteNote(tNoteDTO)).called(1);
      verifyNoMoreInteractions(mockedNotesRepository);
    },
  );
}
