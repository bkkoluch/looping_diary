import 'package:looping_diary/core/domain/use_case.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';

class SaveAllNotesUseCase extends UseCase<Future<void>, List<Note>> {
  SaveAllNotesUseCase(this.notesRepository);

  final NotesRepository notesRepository;

  @override
  Future<void> call(List<Note> allNotes) async {
    final List<NoteDTO> notesToSave = allNotes.map(NoteDTO.fromNote).toList();
    await notesRepository.saveAllNotes(notesToSave);
  }
}
