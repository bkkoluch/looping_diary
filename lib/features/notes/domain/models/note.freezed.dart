// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Note {
  String get id => throw _privateConstructorUsedError;
  NoteDate get noteDate => throw _privateConstructorUsedError;
  String? get entry => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteCopyWith<Note> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCopyWith<$Res> {
  factory $NoteCopyWith(Note value, $Res Function(Note) then) = _$NoteCopyWithImpl<$Res>;

  $Res call({String id, NoteDate noteDate, String? entry});

  $NoteDateCopyWith<$Res> get noteDate;
}

/// @nodoc
class _$NoteCopyWithImpl<$Res> implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._value, this._then);

  final Note _value;
  // ignore: unused_field
  final $Res Function(Note) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? noteDate = freezed,
    Object? entry = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      noteDate: noteDate == freezed
          ? _value.noteDate
          : noteDate // ignore: cast_nullable_to_non_nullable
              as NoteDate,
      entry: entry == freezed
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $NoteDateCopyWith<$Res> get noteDate {
    return $NoteDateCopyWith<$Res>(_value.noteDate, (value) {
      return _then(_value.copyWith(noteDate: value));
    });
  }
}

/// @nodoc
abstract class _$$_NoteCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$$_NoteCopyWith(_$_Note value, $Res Function(_$_Note) then) = __$$_NoteCopyWithImpl<$Res>;

  @override
  $Res call({String id, NoteDate noteDate, String? entry});

  @override
  $NoteDateCopyWith<$Res> get noteDate;
}

/// @nodoc
class __$$_NoteCopyWithImpl<$Res> extends _$NoteCopyWithImpl<$Res> implements _$$_NoteCopyWith<$Res> {
  __$$_NoteCopyWithImpl(_$_Note _value, $Res Function(_$_Note) _then) : super(_value, (v) => _then(v as _$_Note));

  @override
  _$_Note get _value => super._value as _$_Note;

  @override
  $Res call({
    Object? id = freezed,
    Object? noteDate = freezed,
    Object? entry = freezed,
  }) {
    return _then(_$_Note(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      noteDate: noteDate == freezed
          ? _value.noteDate
          : noteDate // ignore: cast_nullable_to_non_nullable
              as NoteDate,
      entry: entry == freezed
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Note implements _Note {
  const _$_Note({required this.id, required this.noteDate, this.entry});

  @override
  final String id;
  @override
  final NoteDate noteDate;
  @override
  final String? entry;

  @override
  String toString() {
    return 'Note(id: $id, noteDate: $noteDate, entry: $entry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Note &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.noteDate, noteDate) &&
            const DeepCollectionEquality().equals(other.entry, entry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(noteDate), const DeepCollectionEquality().hash(entry));

  @JsonKey(ignore: true)
  @override
  _$$_NoteCopyWith<_$_Note> get copyWith => __$$_NoteCopyWithImpl<_$_Note>(this, _$identity);
}

abstract class _Note implements Note {
  const factory _Note({required final String id, required final NoteDate noteDate, final String? entry}) = _$_Note;

  @override
  String get id => throw _privateConstructorUsedError;

  @override
  NoteDate get noteDate => throw _privateConstructorUsedError;

  @override
  String? get entry => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$$_NoteCopyWith<_$_Note> get copyWith => throw _privateConstructorUsedError;
}
