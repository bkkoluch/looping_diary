import 'package:looping_diary/core/data/endpoints.dart';
import 'package:looping_diary/core/errors/remote_exceptions.dart';
import 'package:looping_diary/core/network/firebase_rest_client.dart';
import 'package:looping_diary/features/notes/data/datasources/notes_remote_data_source.dart';
import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';

class NotesRemoteDataSourceImpl implements NotesRemoteDataSource {
  const NotesRemoteDataSourceImpl(this._firebaseRestClient);

  final FirebaseRestClient _firebaseRestClient;

  @override
  Future<void> saveNote(NoteDto noteDto) async {
    try {
      await _firebaseRestClient.patch('${Endpoints.notes}/${noteDto.noteDate.toReadableDate}', noteDto.toJson());
    } catch (e) {
      throw ServerException('An error occurred in $saveNote');
    }
  }

  @override
  Future<NoteDto> getNote(NoteDateDto noteDate) async {
    try {
      return await _firebaseRestClient.get('${Endpoints.notes}/${noteDate.toReadableDate}');
    } catch (e) {
      throw ServerException('An error occurred in $getNote');
    }
  }
}
