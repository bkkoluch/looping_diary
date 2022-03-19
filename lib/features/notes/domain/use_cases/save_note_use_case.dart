import 'package:dartz/dartz.dart';
import 'package:looping_diary/core/domain/usecase.dart';
import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';

class SaveNoteUseCase implements UseCase<void, NoteDto> {
  const SaveNoteUseCase(this._notesRepository);

  final NotesRepository _notesRepository;

  @override
  Future<Either<Failure, void>> call(NoteDto noteDto) => _notesRepository.saveNote(noteDto);
}
