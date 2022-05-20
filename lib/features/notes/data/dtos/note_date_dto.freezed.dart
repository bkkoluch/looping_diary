// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_date_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteDateDTO _$NoteDateDTOFromJson(Map<String, dynamic> json) {
  return _NoteDateDTO.fromJson(json);
}

/// @nodoc
mixin _$NoteDateDTO {
  int get day => throw _privateConstructorUsedError;

  int get month => throw _privateConstructorUsedError;

  int get year => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteDateDTOCopyWith<NoteDateDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDateDTOCopyWith<$Res> {
  factory $NoteDateDTOCopyWith(NoteDateDTO value, $Res Function(NoteDateDTO) then) = _$NoteDateDTOCopyWithImpl<$Res>;

  $Res call({int day, int month, int year});
}

/// @nodoc
class _$NoteDateDTOCopyWithImpl<$Res> implements $NoteDateDTOCopyWith<$Res> {
  _$NoteDateDTOCopyWithImpl(this._value, this._then);

  final NoteDateDTO _value;

  // ignore: unused_field
  final $Res Function(NoteDateDTO) _then;

  @override
  $Res call({
    Object? day = freezed,
    Object? month = freezed,
    Object? year = freezed,
  }) {
    return _then(_value.copyWith(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_NoteDateDTOCopyWith<$Res> implements $NoteDateDTOCopyWith<$Res> {
  factory _$$_NoteDateDTOCopyWith(_$_NoteDateDTO value, $Res Function(_$_NoteDateDTO) then) =
      __$$_NoteDateDTOCopyWithImpl<$Res>;

  @override
  $Res call({int day, int month, int year});
}

/// @nodoc
class __$$_NoteDateDTOCopyWithImpl<$Res> extends _$NoteDateDTOCopyWithImpl<$Res>
    implements _$$_NoteDateDTOCopyWith<$Res> {
  __$$_NoteDateDTOCopyWithImpl(_$_NoteDateDTO _value, $Res Function(_$_NoteDateDTO) _then)
      : super(_value, (v) => _then(v as _$_NoteDateDTO));

  @override
  _$_NoteDateDTO get _value => super._value as _$_NoteDateDTO;

  @override
  $Res call({
    Object? day = freezed,
    Object? month = freezed,
    Object? year = freezed,
  }) {
    return _then(_$_NoteDateDTO(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NoteDateDTO extends _NoteDateDTO {
  const _$_NoteDateDTO({required this.day, required this.month, required this.year}) : super._();

  factory _$_NoteDateDTO.fromJson(Map<String, dynamic> json) => _$$_NoteDateDTOFromJson(json);

  @override
  final int day;
  @override
  final int month;
  @override
  final int year;

  @override
  String toString() {
    return 'NoteDateDTO(day: $day, month: $month, year: $year)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteDateDTO &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality().equals(other.year, year));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(month), const DeepCollectionEquality().hash(year));

  @JsonKey(ignore: true)
  @override
  _$$_NoteDateDTOCopyWith<_$_NoteDateDTO> get copyWith =>
      __$$_NoteDateDTOCopyWithImpl<_$_NoteDateDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoteDateDTOToJson(this);
  }
}

abstract class _NoteDateDTO extends NoteDateDTO {
  const factory _NoteDateDTO({required final int day, required final int month, required final int year}) =
      _$_NoteDateDTO;

  const _NoteDateDTO._() : super._();

  factory _NoteDateDTO.fromJson(Map<String, dynamic> json) = _$_NoteDateDTO.fromJson;

  @override
  int get day => throw _privateConstructorUsedError;

  @override
  int get month => throw _privateConstructorUsedError;

  @override
  int get year => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$$_NoteDateDTOCopyWith<_$_NoteDateDTO> get copyWith => throw _privateConstructorUsedError;
}
