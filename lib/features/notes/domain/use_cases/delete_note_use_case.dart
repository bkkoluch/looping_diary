import 'package:dartz/dartz.dart';
import 'package:looping_diary/core/domain/use_case.dart';
import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';

class DeleteNoteUseCase extends UseCase<Future<Either<Failure, void>>, Note> {
  DeleteNoteUseCase(this.notesRepository);

  final NotesRepository notesRepository;

  @override
  Future<Either<Failure, void>> call(Note note) async {
    final NoteDTO noteDTO = NoteDTO.fromNote(note);
    return await notesRepository.deleteNote(noteDTO);
  }
}
