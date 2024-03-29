import 'package:dartz/dartz.dart';
import 'package:looping_diary/core/domain/use_case.dart';
import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';

class SaveNoteUseCase implements UseCase<Future<Either<Failure, void>>, Note> {
  const SaveNoteUseCase(this._notesRepository);

  final NotesRepository _notesRepository;

  @override
  Future<Either<Failure, void>> call(Note note) async {
    final NoteDTO noteDTO = NoteDTO.fromNote(note);
    return await _notesRepository.saveNote(noteDTO);
  }
}
