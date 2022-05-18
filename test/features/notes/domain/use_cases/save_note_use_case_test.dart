import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';
import 'package:looping_diary/features/notes/domain/use_cases/save_note_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_setup.dart';

class MockNotesRepository extends Mock implements NotesRepository {}

void main() {
  late NotesRepository _mockedNotesRepository;
  late SaveNoteUseCase _saveNoteUseCase;

  setUpAll(baseSetup);
  tearDownAll(baseTearDown);

  setUp(() {
    _mockedNotesRepository = MockNotesRepository();
    _saveNoteUseCase = SaveNoteUseCase(_mockedNotesRepository);
  });

  test(
    'should return Right(null) and correctly delegate call to NotesRepository on a successful call',
    () async {
      // arrange
      when(() => _mockedNotesRepository.saveNote(captureAny())).thenAnswer((_) async => const Right(null));

      // act
      final result = await _saveNoteUseCase(tNote);

      // assert
      expect(result, const Right(null));
      verify(() => _mockedNotesRepository.saveNote(tNoteDto)).called(1);
      verifyNoMoreInteractions(_mockedNotesRepository);
    },
  );

  test(
    'should return Left(ServerFailure) on an unsuccessful call',
    () async {
      // arrange
      when(() => _mockedNotesRepository.saveNote(captureAny())).thenAnswer(
        (_) async => const Left(tServerFailure),
      );

      // act
      final result = await _saveNoteUseCase(tNote);

      // assert
      expect(result, const Left(tServerFailure));
      verify(() => _mockedNotesRepository.saveNote(tNoteDto)).called(1);
      verifyNoMoreInteractions(_mockedNotesRepository);
    },
  );
}
