import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/core/errors/remote_exceptions.dart';
import 'package:looping_diary/features/notes/data/datasources/notes_local_data_source.dart';
import 'package:looping_diary/features/notes/data/datasources/notes_remote_data_source.dart';
import 'package:looping_diary/features/notes/data/repositories/notes_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_mocks.dart';
import '../../../../test_setup.dart';

void main() {
  late NotesLocalDataSource notesLocalDataSource;
  late NotesRemoteDataSource notesRemoteDataSource;
  late NotesRepositoryImpl notesRepositoryImpl;

  setUpAll(baseSetup);

  setUp(() {
    notesLocalDataSource = MockNotesLocalDataSource();
    notesRemoteDataSource = MockNotesRemoteDataSource();
    notesRepositoryImpl = NotesRepositoryImpl(notesLocalDataSource, notesRemoteDataSource);
  });

  group('saveNote', () {
    test(
      'should make a call to both data sources on successful saveNote call',
      () async {
        // arrange
        when(() => notesLocalDataSource.saveNote(captureAny())).thenAnswer((_) async => null);
        when(() => notesRemoteDataSource.saveNote(captureAny())).thenAnswer((_) async => null);

        // act
        final result = await notesRepositoryImpl.saveNote(tNoteDTO);

        // assert
        expect(result, const Right(null));
        verify(() => notesLocalDataSource.saveNote(tNoteDTO)).called(1);
        verify(() => notesRemoteDataSource.saveNote(tNoteDTO)).called(1);
        verifyNoMoreInteractions(notesLocalDataSource);
        verifyNoMoreInteractions(notesRemoteDataSource);
      },
    );

    test(
      'should return ServerFailure on an unsuccessful call to any datasource',
      () async {
        // arrange
        when(() => notesLocalDataSource.saveNote(captureAny())).thenAnswer((_) async => null);
        when(() => notesRemoteDataSource.saveNote(captureAny())).thenThrow(ServerException('Error'));

        // act
        final result = await notesRepositoryImpl.saveNote(tNoteDTO);

        // assert
        result.fold((failure) => expect(failure, isInstanceOf<ServerFailure>()), (_) {});
        verify(() => notesLocalDataSource.saveNote(tNoteDTO)).called(1);
        verify(() => notesRemoteDataSource.saveNote(tNoteDTO)).called(1);
        verifyNoMoreInteractions(notesLocalDataSource);
        verifyNoMoreInteractions(notesRemoteDataSource);
      },
    );
  });
}
