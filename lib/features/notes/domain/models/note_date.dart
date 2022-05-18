import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';

part 'note_date.freezed.dart';

@freezed
class NoteDate with _$NoteDate {
  const NoteDate._();

  const factory NoteDate({
    required int day,
    required int month,
    required int year,
  }) = _NoteDate;

  factory NoteDate.fromDto(NoteDateDto dto) => NoteDate(
        day: dto.day,
        month: dto.month,
        year: dto.year,
      );

  static NoteDate get today {
    final DateTime now = DateTime.now();
    return NoteDate(day: now.day, month: now.month, year: now.year);
  }

  String get toReadableDate => '$day/$month/$year';
}
