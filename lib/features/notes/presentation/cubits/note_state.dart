import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';

part 'note_state.freezed.dart';

enum NoteStateStatus {
  loading,
  loaded,
}

@freezed
class NoteState with _$NoteState {
  const NoteState._();

  const factory NoteState({
    required List<Note> allNotes,
    required Note currentNote,
    required NoteStateStatus status,
  }) = _NoteState;

  factory NoteState.initial() {
    final DateTime now = DateTime.now();
    return NoteState(
      currentNote: Note(
        id: now.toIso8601String(),
        entry: '',
        noteDate: NoteDate(
          day: now.day,
          month: now.month,
          year: now.year,
        ),
      ),
      allNotes: List.empty(growable: true),
      status: NoteStateStatus.loading,
    );
  }
}
