import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';

abstract class NotesLocalDataSource {
  Future<void> saveNote(NoteDto note);

  NoteDto? getNote(NoteDateDto noteDate);

  Future<void> saveAllNotes(List<NoteDto> allNotes);

  List<NoteDto> getAllNotes();
}
