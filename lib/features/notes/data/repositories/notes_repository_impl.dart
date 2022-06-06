import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/core/errors/remote_exceptions.dart';
import 'package:looping_diary/features/notes/data/data_sources/notes_local_data_source.dart';
import 'package:looping_diary/features/notes/data/data_sources/notes_remote_data_source.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';

@Injectable(as: NotesRepository)
class NotesRepositoryImpl implements NotesRepository {
  const NotesRepositoryImpl(this._notesLocalDataSource, this._notesRemoteDataSource);

  final NotesLocalDataSource _notesLocalDataSource;
  final NotesRemoteDataSource _notesRemoteDataSource;

  @override
  Future<Either<Failure, void>> saveNote(NoteDTO noteDTO) async {
    try {
      await _notesLocalDataSource.saveNote(noteDTO);
      await _notesRemoteDataSource.saveNote(noteDTO);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException {
      return const Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<NoteDTO>>> getAllNotes() async {
    try {
      // TODO: Maybe use localNotes somewhere if needed,
      // currently they are only saved locally
      final List<NoteDTO> localNotes = _notesLocalDataSource.getAllNotes();
      final List<NoteDTO> remoteNotes = await _notesRemoteDataSource.getAllNotes();

      if (remoteNotes.length > localNotes.length) {
        await _notesLocalDataSource.saveAllNotes(remoteNotes);
      }
      return Right(remoteNotes);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException {
      return const Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteNote(NoteDTO noteDTO) async {
    try {
      return Right(await _notesRemoteDataSource.deleteNote(noteDTO));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException {
      return const Left(NoConnectionFailure());
    }
  }
}
