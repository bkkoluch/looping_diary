// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteDate {
  int get day => throw _privateConstructorUsedError;

  int get month => throw _privateConstructorUsedError;

  int get year => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteDateCopyWith<NoteDate> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDateCopyWith<$Res> {
  factory $NoteDateCopyWith(NoteDate value, $Res Function(NoteDate) then) = _$NoteDateCopyWithImpl<$Res>;
  $Res call({int day, int month, int year});
}

/// @nodoc
class _$NoteDateCopyWithImpl<$Res> implements $NoteDateCopyWith<$Res> {
  _$NoteDateCopyWithImpl(this._value, this._then);

  final NoteDate _value;
  // ignore: unused_field
  final $Res Function(NoteDate) _then;

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
abstract class _$$_NoteDateCopyWith<$Res> implements $NoteDateCopyWith<$Res> {
  factory _$$_NoteDateCopyWith(_$_NoteDate value, $Res Function(_$_NoteDate) then) = __$$_NoteDateCopyWithImpl<$Res>;

  @override
  $Res call({int day, int month, int year});
}

/// @nodoc
class __$$_NoteDateCopyWithImpl<$Res> extends _$NoteDateCopyWithImpl<$Res> implements _$$_NoteDateCopyWith<$Res> {
  __$$_NoteDateCopyWithImpl(_$_NoteDate _value, $Res Function(_$_NoteDate) _then)
      : super(_value, (v) => _then(v as _$_NoteDate));

  @override
  _$_NoteDate get _value => super._value as _$_NoteDate;

  @override
  $Res call({
    Object? day = freezed,
    Object? month = freezed,
    Object? year = freezed,
  }) {
    return _then(_$_NoteDate(
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

class _$_NoteDate extends _NoteDate {
  const _$_NoteDate({required this.day, required this.month, required this.year}) : super._();

  @override
  final int day;
  @override
  final int month;
  @override
  final int year;

  @override
  String toString() {
    return 'NoteDate(day: $day, month: $month, year: $year)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteDate &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality().equals(other.year, year));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(month), const DeepCollectionEquality().hash(year));

  @JsonKey(ignore: true)
  @override
  _$$_NoteDateCopyWith<_$_NoteDate> get copyWith => __$$_NoteDateCopyWithImpl<_$_NoteDate>(this, _$identity);
}

abstract class _NoteDate extends NoteDate {
  const factory _NoteDate({required final int day, required final int month, required final int year}) = _$_NoteDate;

  const _NoteDate._() : super._();

  @override
  int get day => throw _privateConstructorUsedError;

  @override
  int get month => throw _privateConstructorUsedError;

  @override
  int get year => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$$_NoteDateCopyWith<_$_NoteDate> get copyWith => throw _privateConstructorUsedError;
}
