import 'dart:convert';

import 'package:http/http.dart';
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
  Future<void> saveNote(NoteDTO noteDTO) async {
    try {
      await _firebaseRestClient.patchWithQueryParameters(
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
  Future<NoteDTO> getNote(NoteDateDTO noteDate) async {
    try {
      return await _firebaseRestClient.get('${Endpoints.notes}/${noteDate.withAppendedChars}');
    } catch (e) {
      throw ServerException('An error occurred in $getNote: $e');
    }
  }

  @override
  Future<List<NoteDTO>> getAllNotes() async {
    try {
      final Response result = await _firebaseRestClient.get(Endpoints.notes);

      final Map<String, dynamic> firebaseJson = json.decode(result.body)['fields'];

      final Map<String, dynamic> resultAfterConversion =
          getIt<FirebaseJsonConverter>().convertFirebaseJsonToUnderstandableOne(firebaseJson);

      final List<NoteDTO> notes = resultAfterConversion.entries.map((e) => NoteDTO.fromJson(e.value)).toList()
        ..sort((a, b) => a.noteDate.toDateTime.compareTo(b.noteDate.toDateTime));

      return notes;
    } catch (e) {
      throw ServerException('An error occurred in $getAllNotes: $e');
    }
  }
}
