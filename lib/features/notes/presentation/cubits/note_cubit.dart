import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/core/extensions/datetime_extensions.dart';
import 'package:looping_diary/core/extensions/list_extensions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';
import 'package:looping_diary/features/notes/domain/use_cases/delete_note_use_case.dart';
import 'package:looping_diary/features/notes/domain/use_cases/get_all_notes_use_case.dart';
import 'package:looping_diary/features/notes/domain/use_cases/save_note_use_case.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_state.dart';

@lazySingleton
class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteState.initial());

  void fetchAllNotes() async {
    emit(state.copyWith(status: NoteStateStatus.loading));
    final result = await (await getIt.getAsync<GetAllNotesUseCase>())();

    result.fold(
      _emitErrorStateDependingOnAFailure,
      (List<Note> notes) {
        _sortNotesByDayAndYear(notes);
        emit(state.copyWith(status: NoteStateStatus.loaded));
      },
    );
  }

  void saveNote() async {
    emit(state.copyWith(status: NoteStateStatus.loading));

    final result = await (await getIt.getAsync<SaveNoteUseCase>())(state.currentNote);

    result.fold(
      _emitErrorStateDependingOnAFailure,
      (_) {
        final int listIndex = state.currentNote.noteDate.toDateTime.dayOfYear;

        final List<List<Note>> notes = state.notesSortedByDayAndYears.clone();
        final Note? noteToUpdate =
            notes[listIndex].firstWhereOrNull((note) => note.noteDate == state.currentNote.noteDate);
        if (listIndex >= 0 && noteToUpdate != null) {
          final int noteIndex = notes[listIndex]
              .indexOf(notes[listIndex].firstWhere((note) => note.noteDate == state.currentNote.noteDate));
          notes[listIndex][noteIndex] = state.currentNote;
        } else {
          notes[listIndex].add(state.currentNote);
        }

        emit(
          state.copyWith(
            notesSortedByDayAndYears: notes,
            status: NoteStateStatus.loaded,
            shouldShowNoteSavedSnackBar: true,
          ),
        );
      },
    );
  }

  void updateNoteEntry(String entry) => emit(state.copyWith.currentNote(entry: entry));

  void updateCurrentNote(Note? note) => emit(state.copyWith(currentNote: note ?? Note.today));

  void deleteNote() async {
    emit(state.copyWith(status: NoteStateStatus.loading));

    final result = await (await getIt.getAsync<DeleteNoteUseCase>())(state.currentNote);

    result.fold(
      _emitErrorStateDependingOnAFailure,
      (_) {
        final int listIndex = state.currentNote.noteDate.toDateTime.dayOfYear;

        final List<List<Note>> notes = state.notesSortedByDayAndYears.clone();
        final Note? noteToRemove =
            notes[listIndex].firstWhereOrNull((note) => note.noteDate == state.currentNote.noteDate);

        notes[listIndex].remove(noteToRemove);

        emit(
          state.copyWith(
            notesSortedByDayAndYears: notes,
            status: NoteStateStatus.loaded,
            shouldShowNoteDeletedSnackBar: true,
          ),
        );
      },
    );
  }

  void clearShouldShowNoteSavedSnackBar() => emit(state.copyWith(shouldShowNoteSavedSnackBar: false));

  void clearShouldShowNoteDeletedSnackBar() => emit(state.copyWith(shouldShowNoteDeletedSnackBar: false));

  Note? getNoteForDate(NoteDate noteDate) {
    final List<Note>? notesWithTheDate = state.notesSortedByDayAndYears.firstWhereOrNull(
      (List<Note> noteListForEachDay) => noteListForEachDay.any((note) => note.noteDate == noteDate),
    );

    if (notesWithTheDate == null) {
      return null;
    }

    return notesWithTheDate.firstWhere((note) => note.noteDate == noteDate);
  }

  void _emitErrorStateDependingOnAFailure(Failure failure) {
    if (failure is ServerFailure) {
      _emitGeneralErrorStatus();
    } else if (failure is NoConnectionFailure) {
      _emitNoConnectionErrorStatus();
    }
  }

  void _emitNoConnectionErrorStatus() => emit(state.copyWith(status: NoteStateStatus.noConnectionError));

  void _emitGeneralErrorStatus() => emit(state.copyWith(status: NoteStateStatus.generalError));

  void _sortNotesByDayAndYear(List<Note> notes) {
    final List<List<Note>> sortedList = List.generate(366, (_) => []);
    for (final Note note in notes) {
      sortedList[note.noteDate.toDateTime.dayOfYear].add(note);
    }

    for (final List<Note> list in sortedList) {
      list.sort((a, b) => b.noteDate.toDateTime.compareTo(a.noteDate.toDateTime));
    }

    emit(state.copyWith(notesSortedByDayAndYears: sortedList, status: NoteStateStatus.loaded));
  }
}
