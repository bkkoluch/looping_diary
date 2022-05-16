import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/data/endpoints.dart';
import 'package:looping_diary/core/errors/remote_exceptions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/network/firebase_json_converter.dart';
import 'package:looping_diary/core/network/firebase_rest_client.dart';
import 'package:looping_diary/features/notes/data/datasources/notes_remote_data_source.dart';
import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';

@Injectable(as: NotesRemoteDataSource)
class NotesRemoteDataSourceImpl implements NotesRemoteDataSource {
  const NotesRemoteDataSourceImpl(this._firebaseRestClient);

  final FirebaseRestClient _firebaseRestClient;

  final String notesField = 'notes';
  final String updateMaskFieldPathsString = 'updateMask.fieldPaths';

  @override
  Future<void> saveNote(NoteDto noteDto) async {
    try {
      await _firebaseRestClient.patchWithQueryParameters(
        Endpoints.notes,
        getIt<FirebaseJsonConverter>().convertToFirebaseJson(
          notesField,
          {noteDto.noteDate.withAppendedChars: noteDto.toJson()},
        ),
        {
          updateMaskFieldPathsString: [noteDto.noteDate.withAppendedChars]
        },
      );
    } catch (e) {
      throw ServerException('An error occurred in $saveNote: $e');
    }
  }

  @override
  Future<NoteDto> getNote(NoteDateDto noteDate) async {
    try {
      return await _firebaseRestClient.get('${Endpoints.notes}/${noteDate.withAppendedChars}');
    } catch (e) {
      throw ServerException('An error occurred in $getNote: $e');
    }
  }

  @override
  Future<List<NoteDto>> getAllNotes() async {
    try {
      final result = await _firebaseRestClient.get(Endpoints.notes);

      final resultAfterConversion =
          getIt<FirebaseJsonConverter>().convertFirebaseJsonToUnderstandableOne(result['fields']);

      final List<NoteDto> notes = resultAfterConversion.entries.map((e) => NoteDto.fromJson(e.value)).toList();

      return notes;
    } catch (e) {
      throw ServerException('An error occurred in $getAllNotes: $e');
    }
  }
}
