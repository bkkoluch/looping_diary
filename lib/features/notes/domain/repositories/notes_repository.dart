import 'package:dartz/dartz.dart';
import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';

abstract class NotesRepository {
  Future<Either<Failure, void>> saveNote(NoteDto noteDto);

  Future<Either<Failure, NoteDto>> getNote(NoteDateDto noteDate);
}
