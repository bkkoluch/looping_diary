import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const factory Note({
    required String id,
    required NoteDate noteDate,
    String? entry,
  }) = _Note;

  factory Note.fromDTO(NoteDTO dto) => Note(
        id: dto.id,
        entry: dto.entry,
        noteDate: NoteDate.fromDTO(dto.noteDate),
      );

  static Note get today {
    final DateTime today = NoteDate.today.toDateTime;
    return Note(id: today.toIso8601String(), noteDate: NoteDate.today);
  }
}
