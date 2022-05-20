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
    final DateTime today = NoteDate.today.toDateTime;
    return NoteState(
      currentNote: Note(
        id: today.toIso8601String(),
        noteDate: NoteDate(
          day: today.day,
          month: today.month,
          year: today.year,
        ),
      ),
      allNotes: List.empty(growable: true),
      status: NoteStateStatus.loading,
    );
  }
}
