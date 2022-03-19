import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';
import 'package:looping_diary/features/notes/domain/use_cases/get_note_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_setup.dart';

class MockNotesRepository extends Mock implements NotesRepository {}

void main() {
  late NotesRepository _mockedNotesRepository;
  late GetNoteUseCase _getNoteUseCase;

  setUpAll(baseSetup);

  setUp(() {
    _mockedNotesRepository = MockNotesRepository();
    _getNoteUseCase = GetNoteUseCase(_mockedNotesRepository);
  });

  tearDownAll(baseTearDown);

  test(
    'should return Right(Note) from NoteDto and delegate call to NotesRepository.getNote successful call',
    () async {
      // arrange
      when(() => _mockedNotesRepository.getNote(captureAny())).thenAnswer((_) async => Right(tNoteDto));

      // act
      final result = await _getNoteUseCase(tNoteDateDto);

      // assert
      expect(result, const Right(tNote));
      verify(() => _mockedNotesRepository.getNote(tNoteDateDto)).called(1);
      verifyNoMoreInteractions(_mockedNotesRepository);
    },
  );

  test(
    'should return Left(ServerFailure) on an unsuccessful call',
    () async {
      // arrange
      when(() => _mockedNotesRepository.getNote(captureAny())).thenAnswer((_) async => const Left(tServerFailure));

      // act
      final result = await _getNoteUseCase(tNoteDateDto);

      // assert
      expect(result, const Left(tServerFailure));
      verify(() => _mockedNotesRepository.getNote(tNoteDateDto)).called(1);
      verifyNoMoreInteractions(_mockedNotesRepository);
    },
  );
}
