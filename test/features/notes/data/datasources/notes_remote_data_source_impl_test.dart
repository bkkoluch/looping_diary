import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/data/endpoints.dart';
import 'package:looping_diary/core/errors/remote_exceptions.dart';
import 'package:looping_diary/core/network/firebase_rest_client.dart';
import 'package:looping_diary/features/notes/data/datasources/notes_remote_data_source_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_setup.dart';

class MockFirebaseRestClient extends Mock implements FirebaseRestClient {}

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
      'should make a call to firebaseRestClient.patch on a successful saveNote call',
      () async {
        // arrange
        when(() => _mockFirebaseRestClient.patch(captureAny(), captureAny())).thenAnswer((_) async => null);

        // act
        await _notesRemoteDataSource.saveNote(tNoteDto);

        // assert
        verify(
          () => _mockFirebaseRestClient.patch(
            '${Endpoints.notes}/${tNoteDto.noteDate.toReadableDate}',
            tNoteDto.toJson(),
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
        expect(() async => await result(tNoteDto), throwsA(isA<ServerException>()));
      },
    );
  });

  group(
    'getNote',
    () {
      test(
        'should return NoteDto on a successful getNote call',
        () async {
          // arrange
          when(() => _mockFirebaseRestClient.get(captureAny())).thenAnswer((_) async => tNoteDto);

          // act
          final result = await _notesRemoteDataSource.getNote(tNoteDateDto);

          // assert
          expect(result, tNoteDto);
          verify(() => _mockFirebaseRestClient.get('${Endpoints.notes}/${tNoteDateDto.toReadableDate}'));
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
            () async => await result(tNoteDateDto),
            throwsA(isA<ServerException>()),
          );
        },
      );
    },
  );
}
