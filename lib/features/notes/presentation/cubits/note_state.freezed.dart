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
  List<Note> get allNotes => throw _privateConstructorUsedError;

  List<List<Note>> get notesSortedByDayAndYears => throw _privateConstructorUsedError;

  Note get currentNote => throw _privateConstructorUsedError;

  NoteStateStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteStateCopyWith<NoteState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteStateCopyWith<$Res> {
  factory $NoteStateCopyWith(NoteState value, $Res Function(NoteState) then) = _$NoteStateCopyWithImpl<$Res>;

  $Res call({List<Note> allNotes, List<List<Note>> notesSortedByDayAndYears, Note currentNote, NoteStateStatus status});

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
    Object? allNotes = freezed,
    Object? notesSortedByDayAndYears = freezed,
    Object? currentNote = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      allNotes: allNotes == freezed
          ? _value.allNotes
          : allNotes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
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
  $Res call({List<Note> allNotes, List<List<Note>> notesSortedByDayAndYears, Note currentNote, NoteStateStatus status});

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
    Object? allNotes = freezed,
    Object? notesSortedByDayAndYears = freezed,
    Object? currentNote = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_NoteState(
      allNotes: allNotes == freezed
          ? _value._allNotes
          : allNotes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
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
    ));
  }
}

/// @nodoc

class _$_NoteState extends _NoteState {
  const _$_NoteState(
      {required final List<Note> allNotes,
      required final List<List<Note>> notesSortedByDayAndYears,
      required this.currentNote,
      required this.status})
      : _allNotes = allNotes,
        _notesSortedByDayAndYears = notesSortedByDayAndYears,
        super._();

  final List<Note> _allNotes;

  @override
  List<Note> get allNotes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allNotes);
  }

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
  String toString() {
    return 'NoteState(allNotes: $allNotes, notesSortedByDayAndYears: $notesSortedByDayAndYears, currentNote: $currentNote, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteState &&
            const DeepCollectionEquality().equals(other._allNotes, _allNotes) &&
            const DeepCollectionEquality().equals(other._notesSortedByDayAndYears, _notesSortedByDayAndYears) &&
            const DeepCollectionEquality().equals(other.currentNote, currentNote) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allNotes),
      const DeepCollectionEquality().hash(_notesSortedByDayAndYears),
      const DeepCollectionEquality().hash(currentNote),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_NoteStateCopyWith<_$_NoteState> get copyWith => __$$_NoteStateCopyWithImpl<_$_NoteState>(this, _$identity);
}

abstract class _NoteState extends NoteState {
  const factory _NoteState(
      {required final List<Note> allNotes,
      required final List<List<Note>> notesSortedByDayAndYears,
      required final Note currentNote,
      required final NoteStateStatus status}) = _$_NoteState;

  const _NoteState._() : super._();

  @override
  List<Note> get allNotes => throw _privateConstructorUsedError;

  @override
  List<List<Note>> get notesSortedByDayAndYears => throw _privateConstructorUsedError;

  @override
  Note get currentNote => throw _privateConstructorUsedError;

  @override
  NoteStateStatus get status => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$$_NoteStateCopyWith<_$_NoteState> get copyWith => throw _privateConstructorUsedError;
}
