import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';

part 'note_dto.freezed.dart';
part 'note_dto.g.dart';

@freezed
class NoteDTO with _$NoteDTO {
  const NoteDTO._();

  const factory NoteDTO({
    required String id,
    required String entry,
    required NoteDateDTO noteDate,
  }) = _NoteDTO;

  factory NoteDTO.fromJson(Map<String, dynamic> json) => _$NoteDTOFromJson(json);

  factory NoteDTO.fromNote(Note note) => NoteDTO(
        id: note.id,
        entry: note.entry!,
        noteDate: NoteDateDTO.fromNoteDate(note.noteDate),
      );
}
