import 'package:dartz/dartz.dart';
import 'package:looping_diary/core/domain/use_case.dart';
import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';

class GetNoteUseCase implements UseCase<Future<Either<Failure, Note>>, NoteDateDTO> {
  const GetNoteUseCase(this._notesRepository);

  final NotesRepository _notesRepository;

  @override
  Future<Either<Failure, Note>> call(NoteDateDTO noteDate) async {
    final getNoteResponse = await _notesRepository.getNote(noteDate);

    return getNoteResponse.fold(
      Left.new,
      (NoteDTO noteDTO) => Right(Note.fromDTO(noteDTO)),
    );
  }
}
