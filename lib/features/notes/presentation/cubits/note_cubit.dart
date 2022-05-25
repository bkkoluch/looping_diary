import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/core/extensions/datetime_extensions.dart';
import 'package:looping_diary/core/extensions/either_extensions.dart';
import 'package:looping_diary/core/extensions/list_extensions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/use_cases/get_all_notes_use_case.dart';
import 'package:looping_diary/features/notes/domain/use_cases/save_note_use_case.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_state.dart';

@lazySingleton
class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteState.initial());

  void fetchAllNotes() async {
    emit(state.copyWith(status: NoteStateStatus.loading));
    final List<Note>? notes = (await (await getIt.getAsync<GetAllNotesUseCase>())()).foldOrNull();
    if (notes != null) {
      emit(state.copyWith(allNotes: notes, status: NoteStateStatus.loaded));
      _sortNotesByDayAndYear(notes);
    } else {
      emit(state.copyWith(status: NoteStateStatus.loaded));
    }
  }

  void saveNote() async {
    final result = await (await getIt.getAsync<SaveNoteUseCase>())(state.currentNote);
    if (result is! Failure) {
      final int noteIndex = state.allNotes.indexWhere((note) => note.noteDate == state.currentNote.noteDate);

      final List<Note> notes = state.allNotes.clone();
      if (noteIndex >= 0) {
        notes[noteIndex] = state.currentNote;
      } else {
        notes.add(state.currentNote);
      }

      emit(state.copyWith(allNotes: notes));
    }
  }

  void updateNoteEntry(String entry) => emit(state.copyWith.currentNote(entry: entry));

  void updateCurrentNote(Note? note) => emit(state.copyWith(currentNote: note ?? Note.today));

  void _sortNotesByDayAndYear(List<Note> notes) {
    final List<List<Note>> sortedList = List.generate(366, (_) => []);
    for (final Note note in notes) {
      sortedList[note.noteDate.toDateTime.dayOfYear].add(note);
    }

    for (final List<Note> list in sortedList) {
      list.sort((a, b) => b.noteDate.toDateTime.compareTo(a.noteDate.toDateTime));
    }

    emit(state.copyWith(notesSortedByDayAndYears: sortedList));
  }

  bool get wasNoteCreatedToday =>
      state.allNotes.firstWhereOrNull((note) => note.noteDate == Note.today.noteDate) != null;
}
