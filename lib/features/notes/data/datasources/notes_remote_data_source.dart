import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';

abstract class NotesRemoteDataSource {
  Future<void> saveNote(NoteDTO noteDTO);

  Future<NoteDTO> getNote(NoteDateDTO noteDate);

  Future<List<NoteDTO>> getAllNotes();
}
