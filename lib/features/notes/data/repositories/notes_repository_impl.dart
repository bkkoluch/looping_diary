import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/core/errors/local_exceptions.dart';
import 'package:looping_diary/features/notes/data/datasources/notes_local_data_source.dart';
import 'package:looping_diary/features/notes/data/datasources/notes_remote_data_source.dart';
import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';

@Injectable(as: NotesRepository)
class NotesRepositoryImpl implements NotesRepository {
  const NotesRepositoryImpl(this._notesLocalDataSource, this._notesRemoteDataSource);

  final NotesLocalDataSource _notesLocalDataSource;
  final NotesRemoteDataSource _notesRemoteDataSource;

  @override
  Future<Either<Failure, void>> saveNote(NoteDto noteDto) async {
    try {
      await _notesLocalDataSource.saveNote(noteDto);
      await _notesRemoteDataSource.saveNote(noteDto);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, NoteDto>> getNote(NoteDateDto noteDate) async {
    try {
      NoteDto? noteDto = _notesLocalDataSource.getNote(noteDate);
      if (noteDto != null) {
        return Right(noteDto);
      } else {
        noteDto = await _notesRemoteDataSource.getNote(noteDate);
        await _notesLocalDataSource.saveNote(noteDto);
        return Right(noteDto);
      }
    } on LocalException catch (e) {
      return Left(LocalFailure(e.description));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NoteDto>>> getAllNotes() async {
    try {
      List<NoteDto> notes;
      notes = _notesLocalDataSource.getAllNotes();

      if (notes.isEmpty) {
        notes = await _notesRemoteDataSource.getAllNotes();
        await _notesLocalDataSource.saveAllNotes(notes);
      }

      return Right(notes);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
