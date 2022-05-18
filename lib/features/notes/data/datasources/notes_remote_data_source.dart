import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';

abstract class NotesRemoteDataSource {
  Future<void> saveNote(NoteDto noteDto);

  Future<NoteDto> getNote(NoteDateDto noteDate);

  Future<List<NoteDto>> getAllNotes();
}
