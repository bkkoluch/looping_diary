import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/core/errors/remote_exceptions.dart';
import 'package:looping_diary/features/notes/data/datasources/notes_local_data_source.dart';
import 'package:looping_diary/features/notes/data/datasources/notes_remote_data_source.dart';
import 'package:looping_diary/features/notes/data/repositories/notes_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_setup.dart';

class MockNotesLocalDataSource extends Mock implements NotesLocalDataSource {}

class MockNotesRemoteDataSource extends Mock implements NotesRemoteDataSource {}

void main() {
  late NotesLocalDataSource _notesLocalDataSource;
  late NotesRemoteDataSource _notesRemoteDataSource;
  late NotesRepositoryImpl _notesRepositoryImpl;

  setUpAll(baseSetup);

  setUp(() {
    _notesLocalDataSource = MockNotesLocalDataSource();
    _notesRemoteDataSource = MockNotesRemoteDataSource();
    _notesRepositoryImpl = NotesRepositoryImpl(_notesLocalDataSource, _notesRemoteDataSource);
  });

  group('saveNote', () {
    test(
      'should make a call to both data sources on successful saveNote call',
      () async {
        // arrange
        when(() => _notesLocalDataSource.saveNote(captureAny())).thenAnswer((_) async => null);
        when(() => _notesRemoteDataSource.saveNote(captureAny())).thenAnswer((_) async => null);

        // act
        final result = await _notesRepositoryImpl.saveNote(tNoteDto);

        // assert
        expect(result, const Right(null));
        verify(() => _notesLocalDataSource.saveNote(tNoteDto)).called(1);
        verify(() => _notesRemoteDataSource.saveNote(tNoteDto)).called(1);
        verifyNoMoreInteractions(_notesLocalDataSource);
        verifyNoMoreInteractions(_notesRemoteDataSource);
      },
    );

    test(
      'should return ServerFailure on an unsuccessful call to any datasource',
      () async {
        // arrange
        when(() => _notesLocalDataSource.saveNote(captureAny())).thenAnswer((_) async => null);
        when(() => _notesRemoteDataSource.saveNote(captureAny())).thenThrow(ServerException('Error'));

        // act
        final result = await _notesRepositoryImpl.saveNote(tNoteDto);

        // assert
        result.fold((failure) => expect(failure, isInstanceOf<ServerFailure>()), (_) {});
        verify(() => _notesLocalDataSource.saveNote(tNoteDto)).called(1);
        verify(() => _notesRemoteDataSource.saveNote(tNoteDto)).called(1);
        verifyNoMoreInteractions(_notesLocalDataSource);
        verifyNoMoreInteractions(_notesRemoteDataSource);
      },
    );
  });
}
