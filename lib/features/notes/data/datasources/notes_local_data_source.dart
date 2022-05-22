import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';

abstract class NotesLocalDataSource {
  Future<void> saveNote(NoteDTO note);

  Future<void> saveAllNotes(List<NoteDTO> allNotes);

  List<NoteDTO> getAllNotes();
}
