import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const factory Note({
    required String id,
    required String entry,
    required NoteDate noteDate,
  }) = _Note;

  factory Note.fromDto(NoteDto dto) => Note(
        id: dto.id,
        entry: dto.entry,
        noteDate: NoteDate.fromDto(dto.noteDate),
      );
}
