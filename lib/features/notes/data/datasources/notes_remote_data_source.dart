import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';

abstract class NotesRemoteDataSource {
  Future<void> saveNote(NoteDTO noteDTO);

  Future<List<NoteDTO>> getAllNotes();
}
