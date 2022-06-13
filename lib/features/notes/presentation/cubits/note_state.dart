import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';
import 'package:looping_diary/features/notes/utils/note_helper.dart' as note_helper;

part 'note_state.freezed.dart';

enum NoteStateStatus {
  loading,
  loaded,
  noConnectionError,
  generalError,
}

@freezed
class NoteState with _$NoteState {
  const NoteState._();

  const factory NoteState({
    required List<List<Note>> notesSortedByDayAndYears,
    required Note currentNote,
    required NoteStateStatus status,
    required bool shouldShowNoteSavedSnackBar,
    required bool shouldShowNoteDeletedSnackBar,
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
      notesSortedByDayAndYears: List.empty(growable: true),
      status: NoteStateStatus.loading,
      shouldShowNoteSavedSnackBar: false,
      shouldShowNoteDeletedSnackBar: false,
    );
  }

  bool get loading => status == NoteStateStatus.loading;

  Note get todayNote => todayNoteList.firstWhere((note) => note.noteDate == NoteDate.today);

  List<Note> get todayNoteList => notesSortedByDayAndYears
      .firstWhere((notesList) => notesList.any((note) => note.noteDate == NoteDate.today), orElse: () => [Note.today]);

  int get todayNoteIndex => note_helper.noteDateToPageIndex(NoteDate.today);
}
