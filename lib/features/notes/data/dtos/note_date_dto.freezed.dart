// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_date_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteDateDto _$NoteDateDtoFromJson(Map<String, dynamic> json) {
  return _NoteDateDto.fromJson(json);
}

/// @nodoc
class _$NoteDateDtoTearOff {
  const _$NoteDateDtoTearOff();

  _NoteDateDto call({required int day, required int month, required int year}) {
    return _NoteDateDto(
      day: day,
      month: month,
      year: year,
    );
  }

  NoteDateDto fromJson(Map<String, Object?> json) {
    return NoteDateDto.fromJson(json);
  }
}

/// @nodoc
const $NoteDateDto = _$NoteDateDtoTearOff();

/// @nodoc
mixin _$NoteDateDto {
  int get day => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteDateDtoCopyWith<NoteDateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDateDtoCopyWith<$Res> {
  factory $NoteDateDtoCopyWith(
          NoteDateDto value, $Res Function(NoteDateDto) then) =
      _$NoteDateDtoCopyWithImpl<$Res>;
  $Res call({int day, int month, int year});
}

/// @nodoc
class _$NoteDateDtoCopyWithImpl<$Res> implements $NoteDateDtoCopyWith<$Res> {
  _$NoteDateDtoCopyWithImpl(this._value, this._then);

  final NoteDateDto _value;
  // ignore: unused_field
  final $Res Function(NoteDateDto) _then;

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
abstract class _$NoteDateDtoCopyWith<$Res>
    implements $NoteDateDtoCopyWith<$Res> {
  factory _$NoteDateDtoCopyWith(
          _NoteDateDto value, $Res Function(_NoteDateDto) then) =
      __$NoteDateDtoCopyWithImpl<$Res>;
  @override
  $Res call({int day, int month, int year});
}

/// @nodoc
class __$NoteDateDtoCopyWithImpl<$Res> extends _$NoteDateDtoCopyWithImpl<$Res>
    implements _$NoteDateDtoCopyWith<$Res> {
  __$NoteDateDtoCopyWithImpl(
      _NoteDateDto _value, $Res Function(_NoteDateDto) _then)
      : super(_value, (v) => _then(v as _NoteDateDto));

  @override
  _NoteDateDto get _value => super._value as _NoteDateDto;

  @override
  $Res call({
    Object? day = freezed,
    Object? month = freezed,
    Object? year = freezed,
  }) {
    return _then(_NoteDateDto(
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
class _$_NoteDateDto extends _NoteDateDto {
  const _$_NoteDateDto(
      {required this.day, required this.month, required this.year})
      : super._();

  factory _$_NoteDateDto.fromJson(Map<String, dynamic> json) =>
      _$$_NoteDateDtoFromJson(json);

  @override
  final int day;
  @override
  final int month;
  @override
  final int year;

  @override
  String toString() {
    return 'NoteDateDto(day: $day, month: $month, year: $year)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoteDateDto &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality().equals(other.year, year));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(month),
      const DeepCollectionEquality().hash(year));

  @JsonKey(ignore: true)
  @override
  _$NoteDateDtoCopyWith<_NoteDateDto> get copyWith =>
      __$NoteDateDtoCopyWithImpl<_NoteDateDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoteDateDtoToJson(this);
  }
}

abstract class _NoteDateDto extends NoteDateDto {
  const factory _NoteDateDto(
      {required int day,
      required int month,
      required int year}) = _$_NoteDateDto;
  const _NoteDateDto._() : super._();

  factory _NoteDateDto.fromJson(Map<String, dynamic> json) =
      _$_NoteDateDto.fromJson;

  @override
  int get day;
  @override
  int get month;
  @override
  int get year;
  @override
  @JsonKey(ignore: true)
  _$NoteDateDtoCopyWith<_NoteDateDto> get copyWith =>
      throw _privateConstructorUsedError;
}
