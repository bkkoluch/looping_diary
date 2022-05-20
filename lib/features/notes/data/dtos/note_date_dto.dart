import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';

part 'note_date_dto.freezed.dart';
part 'note_date_dto.g.dart';

@freezed
class NoteDateDTO with _$NoteDateDTO {
  const NoteDateDTO._();

  const factory NoteDateDTO({
    required int day,
    required int month,
    required int year,
  }) = _NoteDateDTO;

  factory NoteDateDTO.fromJson(Map<String, dynamic> json) => _$NoteDateDTOFromJson(json);

  factory NoteDateDTO.fromNoteDate(NoteDate noteDate) => NoteDateDTO(
        day: noteDate.day,
        month: noteDate.month,
        year: noteDate.year,
      );

  DateTime get toDateTime => DateTime(year, month, day);

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
