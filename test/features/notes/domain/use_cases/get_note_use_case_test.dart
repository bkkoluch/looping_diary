import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';
import 'package:looping_diary/features/notes/domain/use_cases/get_note_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_mocks.dart';
import '../../../../test_setup.dart';

void main() {
  late NotesRepository mockedNotesRepository;
  late GetNoteUseCase getNoteUseCase;

  setUpAll(baseSetup);

  setUp(() {
    mockedNotesRepository = MockNotesRepository();
    getNoteUseCase = GetNoteUseCase(mockedNotesRepository);
  });

  tearDownAll(baseTearDown);

  test(
    'should return Right(Note) from NoteDTO and delegate call to NotesRepository.getNote successful call',
    () async {
      // arrange
      when(() => mockedNotesRepository.getNote(captureAny())).thenAnswer((_) async => const Right(tNoteDTO));

      // act
      final result = await getNoteUseCase(tNoteDateDTO);

      // assert
      expect(result, const Right(tNote));
      verify(() => mockedNotesRepository.getNote(tNoteDateDTO)).called(1);
      verifyNoMoreInteractions(mockedNotesRepository);
    },
  );

  test(
    'should return Left(ServerFailure) on an unsuccessful call',
    () async {
      // arrange
      when(() => mockedNotesRepository.getNote(captureAny())).thenAnswer((_) async => const Left(tServerFailure));

      // act
      final result = await getNoteUseCase(tNoteDateDTO);

      // assert
      expect(result, const Left(tServerFailure));
      verify(() => mockedNotesRepository.getNote(tNoteDateDTO)).called(1);
      verifyNoMoreInteractions(mockedNotesRepository);
    },
  );
}
