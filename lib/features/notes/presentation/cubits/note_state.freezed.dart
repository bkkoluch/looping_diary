// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteState {
  List<List<Note>> get notesSortedByDayAndYears => throw _privateConstructorUsedError;

  Note get currentNote => throw _privateConstructorUsedError;

  NoteStateStatus get status => throw _privateConstructorUsedError;

  bool get shouldShowNoteSavedSnackBar => throw _privateConstructorUsedError;

  bool get shouldShowNoteDeletedSnackBar => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteStateCopyWith<NoteState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteStateCopyWith<$Res> {
  factory $NoteStateCopyWith(NoteState value, $Res Function(NoteState) then) = _$NoteStateCopyWithImpl<$Res>;

  $Res call(
      {List<List<Note>> notesSortedByDayAndYears,
      Note currentNote,
      NoteStateStatus status,
      bool shouldShowNoteSavedSnackBar,
      bool shouldShowNoteDeletedSnackBar});

  $NoteCopyWith<$Res> get currentNote;
}

/// @nodoc
class _$NoteStateCopyWithImpl<$Res> implements $NoteStateCopyWith<$Res> {
  _$NoteStateCopyWithImpl(this._value, this._then);

  final NoteState _value;
  // ignore: unused_field
  final $Res Function(NoteState) _then;

  @override
  $Res call({
    Object? notesSortedByDayAndYears = freezed,
    Object? currentNote = freezed,
    Object? status = freezed,
    Object? shouldShowNoteSavedSnackBar = freezed,
    Object? shouldShowNoteDeletedSnackBar = freezed,
  }) {
    return _then(_value.copyWith(
      notesSortedByDayAndYears: notesSortedByDayAndYears == freezed
          ? _value.notesSortedByDayAndYears
          : notesSortedByDayAndYears // ignore: cast_nullable_to_non_nullable
              as List<List<Note>>,
      currentNote: currentNote == freezed
          ? _value.currentNote
          : currentNote // ignore: cast_nullable_to_non_nullable
              as Note,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NoteStateStatus,
      shouldShowNoteSavedSnackBar: shouldShowNoteSavedSnackBar == freezed
          ? _value.shouldShowNoteSavedSnackBar
          : shouldShowNoteSavedSnackBar // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldShowNoteDeletedSnackBar: shouldShowNoteDeletedSnackBar == freezed
          ? _value.shouldShowNoteDeletedSnackBar
          : shouldShowNoteDeletedSnackBar // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $NoteCopyWith<$Res> get currentNote {
    return $NoteCopyWith<$Res>(_value.currentNote, (value) {
      return _then(_value.copyWith(currentNote: value));
    });
  }
}

/// @nodoc
abstract class _$$_NoteStateCopyWith<$Res> implements $NoteStateCopyWith<$Res> {
  factory _$$_NoteStateCopyWith(_$_NoteState value, $Res Function(_$_NoteState) then) =
      __$$_NoteStateCopyWithImpl<$Res>;

  @override
  $Res call(
      {List<List<Note>> notesSortedByDayAndYears,
      Note currentNote,
      NoteStateStatus status,
      bool shouldShowNoteSavedSnackBar,
      bool shouldShowNoteDeletedSnackBar});

  @override
  $NoteCopyWith<$Res> get currentNote;
}

/// @nodoc
class __$$_NoteStateCopyWithImpl<$Res> extends _$NoteStateCopyWithImpl<$Res> implements _$$_NoteStateCopyWith<$Res> {
  __$$_NoteStateCopyWithImpl(_$_NoteState _value, $Res Function(_$_NoteState) _then)
      : super(_value, (v) => _then(v as _$_NoteState));

  @override
  _$_NoteState get _value => super._value as _$_NoteState;

  @override
  $Res call({
    Object? notesSortedByDayAndYears = freezed,
    Object? currentNote = freezed,
    Object? status = freezed,
    Object? shouldShowNoteSavedSnackBar = freezed,
    Object? shouldShowNoteDeletedSnackBar = freezed,
  }) {
    return _then(_$_NoteState(
      notesSortedByDayAndYears: notesSortedByDayAndYears == freezed
          ? _value._notesSortedByDayAndYears
          : notesSortedByDayAndYears // ignore: cast_nullable_to_non_nullable
              as List<List<Note>>,
      currentNote: currentNote == freezed
          ? _value.currentNote
          : currentNote // ignore: cast_nullable_to_non_nullable
              as Note,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NoteStateStatus,
      shouldShowNoteSavedSnackBar: shouldShowNoteSavedSnackBar == freezed
          ? _value.shouldShowNoteSavedSnackBar
          : shouldShowNoteSavedSnackBar // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldShowNoteDeletedSnackBar: shouldShowNoteDeletedSnackBar == freezed
          ? _value.shouldShowNoteDeletedSnackBar
          : shouldShowNoteDeletedSnackBar // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NoteState extends _NoteState {
  const _$_NoteState(
      {required final List<List<Note>> notesSortedByDayAndYears,
      required this.currentNote,
      required this.status,
      required this.shouldShowNoteSavedSnackBar,
      required this.shouldShowNoteDeletedSnackBar})
      : _notesSortedByDayAndYears = notesSortedByDayAndYears,
        super._();

  final List<List<Note>> _notesSortedByDayAndYears;
  @override
  List<List<Note>> get notesSortedByDayAndYears {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notesSortedByDayAndYears);
  }

  @override
  final Note currentNote;
  @override
  final NoteStateStatus status;
  @override
  final bool shouldShowNoteSavedSnackBar;
  @override
  final bool shouldShowNoteDeletedSnackBar;

  @override
  String toString() {
    return 'NoteState(notesSortedByDayAndYears: $notesSortedByDayAndYears, currentNote: $currentNote, status: $status, shouldShowNoteSavedSnackBar: $shouldShowNoteSavedSnackBar, shouldShowNoteDeletedSnackBar: $shouldShowNoteDeletedSnackBar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteState &&
            const DeepCollectionEquality().equals(other._notesSortedByDayAndYears, _notesSortedByDayAndYears) &&
            const DeepCollectionEquality().equals(other.currentNote, currentNote) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.shouldShowNoteSavedSnackBar, shouldShowNoteSavedSnackBar) &&
            const DeepCollectionEquality().equals(other.shouldShowNoteDeletedSnackBar, shouldShowNoteDeletedSnackBar));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notesSortedByDayAndYears),
      const DeepCollectionEquality().hash(currentNote),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(shouldShowNoteSavedSnackBar),
      const DeepCollectionEquality().hash(shouldShowNoteDeletedSnackBar));

  @JsonKey(ignore: true)
  @override
  _$$_NoteStateCopyWith<_$_NoteState> get copyWith => __$$_NoteStateCopyWithImpl<_$_NoteState>(this, _$identity);
}

abstract class _NoteState extends NoteState {
  const factory _NoteState(
      {required final List<List<Note>> notesSortedByDayAndYears,
      required final Note currentNote,
      required final NoteStateStatus status,
      required final bool shouldShowNoteSavedSnackBar,
      required final bool shouldShowNoteDeletedSnackBar}) = _$_NoteState;
  const _NoteState._() : super._();

  @override
  List<List<Note>> get notesSortedByDayAndYears => throw _privateConstructorUsedError;

  @override
  Note get currentNote => throw _privateConstructorUsedError;
  @override
  NoteStateStatus get status => throw _privateConstructorUsedError;
  @override
  bool get shouldShowNoteSavedSnackBar => throw _privateConstructorUsedError;

  @override
  bool get shouldShowNoteDeletedSnackBar => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$$_NoteStateCopyWith<_$_NoteState> get copyWith => throw _privateConstructorUsedError;
}
