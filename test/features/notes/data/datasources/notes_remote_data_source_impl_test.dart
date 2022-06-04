import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/data/endpoints.dart';
import 'package:looping_diary/core/errors/remote_exceptions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/network/firebase_json_converter.dart';
import 'package:looping_diary/core/network/firebase_rest_client.dart';
import 'package:looping_diary/features/notes/data/data_sources/notes_remote_data_source_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_setup.dart';

void main() {
  late FirebaseRestClient _mockFirebaseRestClient;
  late NotesRemoteDataSourceImpl _notesRemoteDataSource;

  setUpAll(baseSetup);

  setUp(() {
    _mockFirebaseRestClient = MockFirebaseRestClient();
    _notesRemoteDataSource = NotesRemoteDataSourceImpl(_mockFirebaseRestClient);
  });

  group('saveNote', () {
    test(
      'should make a call to firebaseRestClient.patchWithQueryParameters on a successful saveNote call',
      () async {
        // Arrange
        when(
          () => _mockFirebaseRestClient.patchWithQueryParameters(
            captureAny(),
            captureAny(),
            captureAny(),
          ),
        ).thenAnswer((_) async => null);

        // Act
        await _notesRemoteDataSource.saveNote(tNoteDTO);

        // Assert
        verify(
          () => _mockFirebaseRestClient.patchWithQueryParameters(
            Endpoints.notes,
            getIt<FirebaseJsonConverter>().convertToFirebaseJson(
              'notes',
              {tNoteDTO.noteDate.withAppendedChars: tNoteDTO.toJson()},
            ),
            {
              'updateMask.fieldPaths': [tNoteDTO.noteDate.withAppendedChars]
            },
          ),
        ).called(1);
        verifyNoMoreInteractions(_mockFirebaseRestClient);
      },
    );

    test(
      'should throw ServerException on an unsuccessful call',
      () async {
        // Arrange
        when(() => _mockFirebaseRestClient.patchWithQueryParameters(captureAny(), captureAny(), captureAny()))
            .thenThrow(tServerException);

        // Act
        final result = _notesRemoteDataSource.saveNote;

        // Assert
        expect(() async => await result(tNoteDTO), throwsA(isA<ServerException>()));
      },
    );
  });

  group('deleteNote', () {
    test(
      'should make a call to firebaseRestClient.patchWithQueryParameters on a successful deleteNote call',
      () async {
        // Arrange
        when(
          () => _mockFirebaseRestClient.patchWithQueryParameters(
            captureAny(),
            captureAny(),
            captureAny(),
          ),
        ).thenAnswer((_) async => null);

        // Act
        await _notesRemoteDataSource.deleteNote(tNoteDTO);

        // Assert
        verify(
          () => _mockFirebaseRestClient.patchWithQueryParameters(
            Endpoints.notes,
            getIt<FirebaseJsonConverter>().convertToFirebaseJson(
              'notes',
              {},
            ),
            {
              'updateMask.fieldPaths': [tNoteDTO.noteDate.withAppendedChars]
            },
          ),
        ).called(1);
        verifyNoMoreInteractions(_mockFirebaseRestClient);
      },
    );

    test(
      'should throw ServerException on an unsuccessful call',
      () async {
        // Arrange
        when(() => _mockFirebaseRestClient.patchWithQueryParameters(captureAny(), captureAny(), captureAny()))
            .thenThrow(tServerException);

        // Act
        final result = _notesRemoteDataSource.saveNote;

        // Assert
        expect(() async => await result(tNoteDTO), throwsA(isA<ServerException>()));
      },
    );
  });
}
