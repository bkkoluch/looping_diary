// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  AppStateStatus get appStateStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) = _$AppStateCopyWithImpl<$Res>;

  $Res call({AppStateStatus appStateStatus});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? appStateStatus = freezed,
  }) {
    return _then(_value.copyWith(
      appStateStatus: appStateStatus == freezed
          ? _value.appStateStatus
          : appStateStatus // ignore: cast_nullable_to_non_nullable
              as AppStateStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(_$_AppState value, $Res Function(_$_AppState) then) = __$$_AppStateCopyWithImpl<$Res>;

  @override
  $Res call({AppStateStatus appStateStatus});
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res> implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(_$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, (v) => _then(v as _$_AppState));

  @override
  _$_AppState get _value => super._value as _$_AppState;

  @override
  $Res call({
    Object? appStateStatus = freezed,
  }) {
    return _then(_$_AppState(
      appStateStatus: appStateStatus == freezed
          ? _value.appStateStatus
          : appStateStatus // ignore: cast_nullable_to_non_nullable
              as AppStateStatus,
    ));
  }
}

/// @nodoc

class _$_AppState extends _AppState {
  const _$_AppState({required this.appStateStatus}) : super._();

  @override
  final AppStateStatus appStateStatus;

  @override
  String toString() {
    return 'AppState(appStateStatus: $appStateStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            const DeepCollectionEquality().equals(other.appStateStatus, appStateStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(appStateStatus));

  @JsonKey(ignore: true)
  @override
  _$$_AppStateCopyWith<_$_AppState> get copyWith => __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);
}

abstract class _AppState extends AppState {
  const factory _AppState({required final AppStateStatus appStateStatus}) = _$_AppState;

  const _AppState._() : super._();

  @override
  AppStateStatus get appStateStatus => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith => throw _privateConstructorUsedError;
}
