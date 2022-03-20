// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteDto _$NoteDtoFromJson(Map<String, dynamic> json) {
  return _NoteDto.fromJson(json);
}

/// @nodoc
class _$NoteDtoTearOff {
  const _$NoteDtoTearOff();

  _NoteDto call(
      {required String id,
      required String entry,
      required NoteDateDto noteDate}) {
    return _NoteDto(
      id: id,
      entry: entry,
      noteDate: noteDate,
    );
  }

  NoteDto fromJson(Map<String, Object?> json) {
    return NoteDto.fromJson(json);
  }
}

/// @nodoc
const $NoteDto = _$NoteDtoTearOff();

/// @nodoc
mixin _$NoteDto {
  String get id => throw _privateConstructorUsedError;
  String get entry => throw _privateConstructorUsedError;
  NoteDateDto get noteDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteDtoCopyWith<NoteDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDtoCopyWith<$Res> {
  factory $NoteDtoCopyWith(NoteDto value, $Res Function(NoteDto) then) =
      _$NoteDtoCopyWithImpl<$Res>;
  $Res call({String id, String entry, NoteDateDto noteDate});

  $NoteDateDtoCopyWith<$Res> get noteDate;
}

/// @nodoc
class _$NoteDtoCopyWithImpl<$Res> implements $NoteDtoCopyWith<$Res> {
  _$NoteDtoCopyWithImpl(this._value, this._then);

  final NoteDto _value;
  // ignore: unused_field
  final $Res Function(NoteDto) _then;

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
              as NoteDateDto,
    ));
  }

  @override
  $NoteDateDtoCopyWith<$Res> get noteDate {
    return $NoteDateDtoCopyWith<$Res>(_value.noteDate, (value) {
      return _then(_value.copyWith(noteDate: value));
    });
  }
}

/// @nodoc
abstract class _$NoteDtoCopyWith<$Res> implements $NoteDtoCopyWith<$Res> {
  factory _$NoteDtoCopyWith(_NoteDto value, $Res Function(_NoteDto) then) =
      __$NoteDtoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String entry, NoteDateDto noteDate});

  @override
  $NoteDateDtoCopyWith<$Res> get noteDate;
}

/// @nodoc
class __$NoteDtoCopyWithImpl<$Res> extends _$NoteDtoCopyWithImpl<$Res>
    implements _$NoteDtoCopyWith<$Res> {
  __$NoteDtoCopyWithImpl(_NoteDto _value, $Res Function(_NoteDto) _then)
      : super(_value, (v) => _then(v as _NoteDto));

  @override
  _NoteDto get _value => super._value as _NoteDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? entry = freezed,
    Object? noteDate = freezed,
  }) {
    return _then(_NoteDto(
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
              as NoteDateDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NoteDto extends _NoteDto {
  _$_NoteDto({required this.id, required this.entry, required this.noteDate})
      : super._();

  factory _$_NoteDto.fromJson(Map<String, dynamic> json) =>
      _$$_NoteDtoFromJson(json);

  @override
  final String id;
  @override
  final String entry;
  @override
  final NoteDateDto noteDate;

  @override
  String toString() {
    return 'NoteDto(id: $id, entry: $entry, noteDate: $noteDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoteDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.entry, entry) &&
            const DeepCollectionEquality().equals(other.noteDate, noteDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(entry),
      const DeepCollectionEquality().hash(noteDate));

  @JsonKey(ignore: true)
  @override
  _$NoteDtoCopyWith<_NoteDto> get copyWith =>
      __$NoteDtoCopyWithImpl<_NoteDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoteDtoToJson(this);
  }
}

abstract class _NoteDto extends NoteDto {
  factory _NoteDto(
      {required String id,
      required String entry,
      required NoteDateDto noteDate}) = _$_NoteDto;
  _NoteDto._() : super._();

  factory _NoteDto.fromJson(Map<String, dynamic> json) = _$_NoteDto.fromJson;

  @override
  String get id;
  @override
  String get entry;
  @override
  NoteDateDto get noteDate;
  @override
  @JsonKey(ignore: true)
  _$NoteDtoCopyWith<_NoteDto> get copyWith =>
      throw _privateConstructorUsedError;
}
