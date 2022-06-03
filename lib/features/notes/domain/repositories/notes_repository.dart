import 'package:dartz/dartz.dart';
import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';

abstract class NotesRepository {
  Future<Either<Failure, void>> saveNote(NoteDTO noteDTO);

  Future<Either<Failure, List<NoteDTO>>> getAllNotes();

  Future<void> saveAllNotes(List<NoteDTO> allNotes);
}
