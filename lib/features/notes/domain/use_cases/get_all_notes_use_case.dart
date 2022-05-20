import 'package:dartz/dartz.dart';
import 'package:looping_diary/core/domain/use_case.dart';
import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';

class GetAllNotesUseCase extends UseCase<Future<Either<Failure, List<Note>>>, NoParams> {
  GetAllNotesUseCase(this._notesRepository);

  final NotesRepository _notesRepository;

  @override
  Future<Either<Failure, List<Note>>> call([NoParams? params]) async {
    final result = await _notesRepository.getAllNotes();

    return result.fold(
      Left.new,
      (List<NoteDTO> noteDTOs) => Right(noteDTOs.map(Note.fromDTO).toList()),
    );
  }
}
