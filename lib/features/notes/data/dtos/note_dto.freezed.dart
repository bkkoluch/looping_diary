// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteDTO _$NoteDTOFromJson(Map<String, dynamic> json) {
  return _NoteDTO.fromJson(json);
}

/// @nodoc
mixin _$NoteDTO {
  String get id => throw _privateConstructorUsedError;

  String get entry => throw _privateConstructorUsedError;

  NoteDateDTO get noteDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteDTOCopyWith<NoteDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDTOCopyWith<$Res> {
  factory $NoteDTOCopyWith(NoteDTO value, $Res Function(NoteDTO) then) = _$NoteDTOCopyWithImpl<$Res>;

  $Res call({String id, String entry, NoteDateDTO noteDate});

  $NoteDateDTOCopyWith<$Res> get noteDate;
}

/// @nodoc
class _$NoteDTOCopyWithImpl<$Res> implements $NoteDTOCopyWith<$Res> {
  _$NoteDTOCopyWithImpl(this._value, this._then);

  final NoteDTO _value;

  // ignore: unused_field
  final $Res Function(NoteDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? entry = freezed,
    Object? noteDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      entry: entry == freezed
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as String,
      noteDate: noteDate == freezed
          ? _value.noteDate
          : noteDate // ignore: cast_nullable_to_non_nullable
              as NoteDateDTO,
    ));
  }

  @override
  $NoteDateDTOCopyWith<$Res> get noteDate {
    return $NoteDateDTOCopyWith<$Res>(_value.noteDate, (value) {
      return _then(_value.copyWith(noteDate: value));
    });
  }
}

/// @nodoc
abstract class _$$_NoteDTOCopyWith<$Res> implements $NoteDTOCopyWith<$Res> {
  factory _$$_NoteDTOCopyWith(_$_NoteDTO value, $Res Function(_$_NoteDTO) then) = __$$_NoteDTOCopyWithImpl<$Res>;

  @override
  $Res call({String id, String entry, NoteDateDTO noteDate});

  @override
  $NoteDateDTOCopyWith<$Res> get noteDate;
}

/// @nodoc
class __$$_NoteDTOCopyWithImpl<$Res> extends _$NoteDTOCopyWithImpl<$Res> implements _$$_NoteDTOCopyWith<$Res> {
  __$$_NoteDTOCopyWithImpl(_$_NoteDTO _value, $Res Function(_$_NoteDTO) _then)
      : super(_value, (v) => _then(v as _$_NoteDTO));

  @override
  _$_NoteDTO get _value => super._value as _$_NoteDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? entry = freezed,
    Object? noteDate = freezed,
  }) {
    return _then(_$_NoteDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      entry: entry == freezed
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as String,
      noteDate: noteDate == freezed
          ? _value.noteDate
          : noteDate // ignore: cast_nullable_to_non_nullable
              as NoteDateDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NoteDTO extends _NoteDTO {
  const _$_NoteDTO({required this.id, required this.entry, required this.noteDate}) : super._();

  factory _$_NoteDTO.fromJson(Map<String, dynamic> json) => _$$_NoteDTOFromJson(json);

  @override
  final String id;
  @override
  final String entry;
  @override
  final NoteDateDTO noteDate;

  @override
  String toString() {
    return 'NoteDTO(id: $id, entry: $entry, noteDate: $noteDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.entry, entry) &&
            const DeepCollectionEquality().equals(other.noteDate, noteDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(entry), const DeepCollectionEquality().hash(noteDate));

  @JsonKey(ignore: true)
  @override
  _$$_NoteDTOCopyWith<_$_NoteDTO> get copyWith => __$$_NoteDTOCopyWithImpl<_$_NoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoteDTOToJson(this);
  }
}

abstract class _NoteDTO extends NoteDTO {
  const factory _NoteDTO({required final String id, required final String entry, required final NoteDateDTO noteDate}) =
      _$_NoteDTO;

  const _NoteDTO._() : super._();

  factory _NoteDTO.fromJson(Map<String, dynamic> json) = _$_NoteDTO.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;

  @override
  String get entry => throw _privateConstructorUsedError;

  @override
  NoteDateDTO get noteDate => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$$_NoteDTOCopyWith<_$_NoteDTO> get copyWith => throw _privateConstructorUsedError;
}
