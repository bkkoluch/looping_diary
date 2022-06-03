import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/extensions/datetime_extensions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/use_cases/delete_note_use_case.dart';
import 'package:looping_diary/features/notes/domain/use_cases/get_all_notes_use_case.dart';
import 'package:looping_diary/features/notes/domain/use_cases/save_note_use_case.dart';
import 'package:looping_diary/features/notes/presentation/cubits/cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_mocks.dart';
import '../../../../test_setup.dart';

void main() {
  final GetAllNotesUseCase getAllNotesUseCase = MockGetAllNotesUseCase();
  final SaveNoteUseCase saveNoteUseCase = MockSaveNoteUseCase();
  final DeleteNoteUseCase deleteNoteUseCase = MockDeleteNoteUseCase();

  setUpAll(() {
    baseSetup();

    getIt
      ..registerFactory<NoteCubit>(MockNoteCubit.new)
      ..registerFactoryAsync<GetAllNotesUseCase>(() async => getAllNotesUseCase)
      ..registerFactoryAsync<SaveNoteUseCase>(() async => saveNoteUseCase)
      ..registerFactoryAsync<DeleteNoteUseCase>(() async => deleteNoteUseCase);
  });

  final NoteState initialState = NoteState.initial();

  List<List<Note>> sortNotesByDayAndYear(List<Note> notes) {
    final List<List<Note>> sortedList = List.generate(366, (_) => []);
    for (final Note note in notes) {
      sortedList[note.noteDate.toDateTime.dayOfYear].add(note);
    }

    for (final List<Note> list in sortedList) {
      list.sort((a, b) => b.noteDate.toDateTime.compareTo(a.noteDate.toDateTime));
    }

    return sortedList;
  }

  test('NoteCubit\'s initial state equals to NoteState.initial()', () {
    expect(NoteCubit().state, initialState);
  });

  group('NoteCubit::fetchAllNotes', () {
    blocTest<NoteCubit, NoteState>(
      'should emit correct states when use case returns an error',
      build: NoteCubit.new,
      setUp: () {
        when(getAllNotesUseCase.call).thenAnswer((_) async => const Left(tServerFailure));
      },
      act: (cubit) => cubit.fetchAllNotes(),
      expect: () => [
        initialState.copyWith(status: NoteStateStatus.loading),
        initialState.copyWith(
          status: NoteStateStatus.loaded,
          notesSortedByDayAndYears: sortNotesByDayAndYear([]),
        ),
      ],
    );

    blocTest<NoteCubit, NoteState>(
      'should emit correct states when returned list of notes is not null',
      build: NoteCubit.new,
      setUp: () {
        when(getAllNotesUseCase.call).thenAnswer((_) async => const Right([tNote]));
      },
      act: (cubit) => cubit.fetchAllNotes(),
      expect: () => [
        initialState.copyWith(status: NoteStateStatus.loading),
        initialState.copyWith(
          notesSortedByDayAndYears: sortNotesByDayAndYear([tNote]),
          status: NoteStateStatus.loaded,
        ),
      ],
    );
  });

  group('NoteCubit::saveNote', () {
    blocTest<NoteCubit, NoteState>(
      'should emit correct states when note is saved successfully',
      build: NoteCubit.new,
      skip: 2,
      setUp: () {
        when(() => saveNoteUseCase.call(captureAny())).thenAnswer((_) async => const Right(null));
      },
      act: (cubit) => cubit
        ..fetchAllNotes()
        ..updateCurrentNote(tNote)
        ..saveNote(),
      expect: () => [
        initialState.copyWith(
          currentNote: tNote,
          notesSortedByDayAndYears: sortNotesByDayAndYear([tNote]),
          status: NoteStateStatus.loaded,
        )
      ],
    );

    blocTest<NoteCubit, NoteState>(
      'should emit correct states when note saving fails',
      build: NoteCubit.new,
      skip: 2,
      setUp: () {
        when(getAllNotesUseCase.call).thenAnswer((_) async => const Right([tNote]));
        when(() => saveNoteUseCase.call(captureAny())).thenAnswer((_) async => const Left(tServerFailure));
      },
      act: (cubit) => cubit
        ..fetchAllNotes()
        ..updateCurrentNote(tNote)
        ..saveNote(),
      expect: () => [
        initialState.copyWith(
          currentNote: tNote,
          notesSortedByDayAndYears: sortNotesByDayAndYear([tNote]),
          status: NoteStateStatus.loaded,
        ),
      ],
    );
  });

  group('NoteCubit::updateNoteEntry', () {
    blocTest<NoteCubit, NoteState>(
      'should emit correct states when entry is passed',
      build: NoteCubit.new,
      act: (cubit) => cubit.updateNoteEntry(tEntry),
      expect: () => [
        initialState.copyWith(currentNote: initialState.currentNote.copyWith(entry: tEntry)),
      ],
    );
  });

  group('NoteCubit::updateCurrentNote', () {
    blocTest<NoteCubit, NoteState>(
      'should emit correct states when note is passed',
      build: NoteCubit.new,
      act: (cubit) => cubit.updateCurrentNote(tNote),
      expect: () => [
        initialState.copyWith(currentNote: tNote),
      ],
    );

    blocTest<NoteCubit, NoteState>(
      'should emit correct states when null is passed',
      build: NoteCubit.new,
      act: (cubit) => cubit.updateCurrentNote(null),
      expect: () => [
        initialState.copyWith(currentNote: Note.today),
      ],
    );
  });

  group('NoteCubit::deleteNote', () {
    blocTest<NoteCubit, NoteState>(
      'should delete the note correctly',
      skip: 1,
      build: NoteCubit.new,
      setUp: () {
        when(getAllNotesUseCase.call).thenAnswer((_) async => const Right([tNote]));
        when(() => deleteNoteUseCase(captureAny())).thenAnswer((_) async => const Right(null));
      },
      act: (cubit) => cubit
        ..fetchAllNotes()
        ..updateCurrentNote(tNote)
        ..deleteNote(),
      expect: () => [
        initialState.copyWith(currentNote: tNote),
        initialState.copyWith(
          currentNote: tNote,
          notesSortedByDayAndYears: sortNotesByDayAndYear([]),
          status: NoteStateStatus.loaded,
        ),
      ],
      verify: (cubit) {
        verify(getAllNotesUseCase.call).called(1);
        verify(() => deleteNoteUseCase(tNote)).called(1);
      },
    );
  });
}
