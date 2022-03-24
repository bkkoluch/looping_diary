import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';

part 'note_dto.freezed.dart';
part 'note_dto.g.dart';

@freezed
class NoteDto with _$NoteDto {
  const NoteDto._();

  factory NoteDto({
    required String id,
    required String entry,
    required NoteDateDto noteDate,
  }) = _NoteDto;

  factory NoteDto.fromJson(Map<String, dynamic> json) => _$NoteDtoFromJson(json);
}