// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteDto _$$_NoteDtoFromJson(Map<String, dynamic> json) => _$_NoteDto(
      id: json['id'] as String,
      entry: json['entry'] as String,
      noteDate: NoteDateDto.fromJson(json['noteDate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NoteDtoToJson(_$_NoteDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entry': instance.entry,
      'noteDate': instance.noteDate,
    };
