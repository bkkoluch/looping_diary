import 'package:freezed_annotation/freezed_annotation.dart';

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

  String get toReadableDate => '$day/$month/$year';
}
