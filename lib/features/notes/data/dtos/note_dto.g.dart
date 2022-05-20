// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteDTO _$$_NoteDTOFromJson(Map<String, dynamic> json) => _$_NoteDTO(
      id: json['id'] as String,
      entry: json['entry'] as String,
      noteDate: NoteDateDTO.fromJson(json['noteDate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NoteDTOToJson(_$_NoteDTO instance) => <String, dynamic>{
      'id': instance.id,
      'entry': instance.entry,
      'noteDate': instance.noteDate,
    };
