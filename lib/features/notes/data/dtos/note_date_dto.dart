import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';

part 'note_date_dto.freezed.dart';
part 'note_date_dto.g.dart';

@freezed
class NoteDateDto with _$NoteDateDto {
  const NoteDateDto._();

  const factory NoteDateDto({
    required int day,
    required int month,
    required int year,
  }) = _NoteDateDto;

  factory NoteDateDto.fromJson(Map<String, dynamic> json) => _$NoteDateDtoFromJson(json);

  factory NoteDateDto.fromNoteDate(NoteDate noteDate) => NoteDateDto(
        day: noteDate.day,
        month: noteDate.month,
        year: noteDate.year,
      );

  String get toReadableDate => '$day/$month/$year';

  /// Used along with FirebaseRestAPI as regular [toReadableDate] does not work with it
  ///
  /// FirebaseRestAPI seems to not allow chars like '/', '-' (and other) for document's field names
  /// also numbers without edge characters are also not allowed,
  /// Example:
  /// not-allowed: '1/1/2022', '112022'
  /// allowed: 'x112022x'
  String get withAppendedChars => 'x$day$month${year}x';
}
