import 'package:dartz/dartz.dart';
import 'package:looping_diary/core/domain/usecase.dart';
import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';

class GetAllNotesUseCase extends UseCase<List<Note>, NoParams> {
  GetAllNotesUseCase(this._notesRepository);

  final NotesRepository _notesRepository;

  @override
  Future<Either<Failure, List<Note>>> call([NoParams? params]) async {
    final result = await _notesRepository.getAllNotes();

    return result.fold(
      Left.new,
      (List<NoteDto> noteDtos) => Right(noteDtos.map(Note.fromDto).toList()),
    );
  }
}
