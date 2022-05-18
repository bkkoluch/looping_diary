import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/core/extensions/either_extensions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/use_cases/get_all_notes_use_case.dart';
import 'package:looping_diary/features/notes/domain/use_cases/save_note_use_case.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_state.dart';

@lazySingleton
class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteState.initial());

  void saveNote() async {
    final result = await (await getIt.getAsync<SaveNoteUseCase>())(state.currentNote);
    if (result is! Failure) {
      final int noteIndex = state.allNotes.indexWhere((note) => note.noteDate == state.currentNote.noteDate);

      final NoteState stateWithUpdatedNote;
      if (noteIndex >= 0) {
        stateWithUpdatedNote = state
          ..allNotes[state.allNotes.indexWhere((note) => note.noteDate == state.currentNote.noteDate)] =
              state.currentNote;
      } else {
        stateWithUpdatedNote = state..allNotes.add(state.currentNote);
      }

      emit(stateWithUpdatedNote);
    }
  }

  void updateNoteEntry(String entry) => emit(state.copyWith.currentNote(entry: entry));

  void updateCurrentNote(Note? note) {
    emit(state.copyWith(currentNote: note ?? Note.today));
  }

  void fetchAllNotes() async {
    emit(state.copyWith(status: NoteStateStatus.loading));
    final List<Note>? notes = (await (await getIt.getAsync<GetAllNotesUseCase>())()).foldOrNull();
    if (notes != null) {
      emit(state.copyWith(allNotes: notes, status: NoteStateStatus.loaded));
    }
  }

  bool get isTodaysNoteCreated =>
      state.allNotes.firstWhereOrNull((note) => note.noteDate == Note.today.noteDate) != null;
}
