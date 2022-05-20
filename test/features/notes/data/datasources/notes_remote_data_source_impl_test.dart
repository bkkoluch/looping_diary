import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/data/endpoints.dart';
import 'package:looping_diary/core/errors/remote_exceptions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/network/firebase_json_converter.dart';
import 'package:looping_diary/core/network/firebase_rest_client.dart';
import 'package:looping_diary/features/notes/data/datasources/notes_remote_data_source_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_setup.dart';

void main() {
  late FirebaseRestClient _mockFirebaseRestClient;
  late NotesRemoteDataSourceImpl _notesRemoteDataSource;

  setUpAll(() {
    baseSetup();
    getIt.registerFactory<FirebaseJsonConverter>(FirebaseJsonConverter.new);
  });

  setUp(() {
    _mockFirebaseRestClient = MockFirebaseRestClient();
    _notesRemoteDataSource = NotesRemoteDataSourceImpl(_mockFirebaseRestClient);
  });

  group('saveNote', () {
    test(
      'should make a call to firebaseRestClient.patch on a successful saveNote call',
      () async {
        // arrange
        when(
          () => _mockFirebaseRestClient.patchWithQueryParameters(
            captureAny(),
            captureAny(),
            captureAny(),
          ),
        ).thenAnswer((_) async => null);

        // act
        await _notesRemoteDataSource.saveNote(tNoteDTO);

        // assert
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
        // arrange
        when(() => _mockFirebaseRestClient.patch(captureAny(), captureAny()))
            .thenThrow(ServerException('An error occurred in saveNote'));

        // act
        final result = _notesRemoteDataSource.saveNote;

        // assert
        expect(() async => await result(tNoteDTO), throwsA(isA<ServerException>()));
      },
    );
  });

  group(
    'getNote',
    () {
      test(
        'should return NoteDTO on a successful getNote call',
        () async {
          // arrange
          when(() => _mockFirebaseRestClient.get(captureAny())).thenAnswer((_) async => tNoteDTO);

          // act
          final result = await _notesRemoteDataSource.getNote(tNoteDateDTO);

          // assert
          expect(result, tNoteDTO);
          verify(() => _mockFirebaseRestClient.get('${Endpoints.notes}/${tNoteDateDTO.withAppendedChars}'));
          verifyNoMoreInteractions(_mockFirebaseRestClient);
        },
      );

      test(
        'should throw ServerException on an unsuccessful call',
        () async {
          // arrange
          when(() => _mockFirebaseRestClient.get(captureAny()))
              .thenThrow(ServerException('An error occurred in getNote'));

          // act
          final result = _notesRemoteDataSource.getNote;

          // assert
          expect(
            () async => await result(tNoteDateDTO),
            throwsA(isA<ServerException>()),
          );
        },
      );
    },
  );
}
