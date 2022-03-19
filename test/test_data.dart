import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';

// Strings
const String tId = '1';
const String tEntry = 'Some test string';

// Errors
const ServerFailure tServerFailure = ServerFailure('Error');

// Notes
const NoteDate tNoteDate = NoteDate(day: 1, month: 12, year: 2020);
const NoteDateDto tNoteDateDto = NoteDateDto(day: 1, month: 12, year: 2020);

const Note tNote = Note(id: tId, entry: tEntry, noteDate: tNoteDate);
final NoteDto tNoteDto = NoteDto(id: tId, entry: tEntry, noteDate: tNoteDateDto);
