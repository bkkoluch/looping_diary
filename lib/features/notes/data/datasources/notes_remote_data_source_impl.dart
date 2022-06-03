import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/data/endpoints.dart';
import 'package:looping_diary/core/errors/remote_exceptions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/network/firebase_json_converter.dart';
import 'package:looping_diary/core/network/firebase_rest_client.dart';
import 'package:looping_diary/features/notes/data/datasources/notes_remote_data_source.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';

@Injectable(as: NotesRemoteDataSource)
class NotesRemoteDataSourceImpl implements NotesRemoteDataSource {
  const NotesRemoteDataSourceImpl(this.firebaseRestClient);

  final FirebaseRestClient firebaseRestClient;

  final String notesField = 'notes';

  @override
  Future<void> saveNote(NoteDTO noteDTO) async {
    try {
      await firebaseRestClient.patchWithQueryParameters(
        Endpoints.notes,
        getIt<FirebaseJsonConverter>().convertToFirebaseJson(
          notesField,
          {noteDTO.noteDate.withAppendedChars: noteDTO.toJson()},
        ),
        {
          updateMaskFieldPathsString: [noteDTO.noteDate.withAppendedChars]
        },
      );
    } catch (e) {
      throw ServerException('An error occurred in $saveNote: $e');
    }
  }

  @override
  Future<List<NoteDTO>> getAllNotes() async {
    try {
      final Map<String, dynamic> result = await firebaseRestClient.get(Endpoints.notes) ?? {};

      final List<NoteDTO> notes = result.entries.map((e) => NoteDTO.fromJson(e.value)).toList()
        ..sort((a, b) => a.noteDate.toDateTime.compareTo(b.noteDate.toDateTime));

      return notes;
    } catch (e) {
      throw ServerException('An error occurred in $getAllNotes: $e');
    }
  }

  @override
  Future<void> deleteNote(NoteDTO noteDTO) async {
    try {
      await firebaseRestClient.patchWithQueryParameters(
        Endpoints.notes,
        getIt<FirebaseJsonConverter>().convertToFirebaseJson(
          notesField,
          {},
        ),
        {
          updateMaskFieldPathsString: [noteDTO.noteDate.withAppendedChars]
        },
      );
    } catch (e) {
      throw ServerException('An error occurred in $deleteNote: $e');
    }
  }
}
