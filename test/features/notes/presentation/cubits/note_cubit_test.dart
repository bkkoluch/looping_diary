import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/use_cases/get_all_notes_use_case.dart';
import 'package:looping_diary/features/notes/domain/use_cases/save_note_use_case.dart';
import 'package:looping_diary/features/notes/presentation/cubits/cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_data.dart';
import '../../../../test_mocks.dart';
import '../../../../test_setup.dart';

void main() {
  late final GetAllNotesUseCase getAllNotesUseCase = MockGetAllNotesUseCase();
  late final SaveNoteUseCase saveNoteUseCase = MockSaveNoteUseCase();

  setUpAll(() {
    baseSetup();

    getIt
      ..registerFactory<NoteCubit>(MockNoteCubit.new)
      ..registerFactoryAsync<GetAllNotesUseCase>(() async => getAllNotesUseCase)
      ..registerFactoryAsync<SaveNoteUseCase>(() async => saveNoteUseCase);
  });

  final NoteState initialState = NoteState.initial();

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
        initialState.copyWith(status: NoteStateStatus.loaded),
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
        initialState.copyWith(allNotes: [tNote], status: NoteStateStatus.loaded),
      ],
    );
  });

  group('NoteCubit::saveNote', () {
    blocTest<NoteCubit, NoteState>(
      'should emit correct states when note is saved successfully',
      build: NoteCubit.new,
      setUp: () {
        when(() => saveNoteUseCase.call(captureAny())).thenAnswer((_) async => const Right(null));
      },
      act: (cubit) => cubit
        ..updateCurrentNote(tNote)
        ..saveNote(),
      expect: () => [
        initialState.copyWith(currentNote: tNote),
        initialState.copyWith(allNotes: [tNote], currentNote: tNote)
      ],
    );

    blocTest<NoteCubit, NoteState>(
      'should emit correct states when note saving fails',
      build: NoteCubit.new,
      setUp: () {
        when(() => saveNoteUseCase.call(captureAny())).thenAnswer((_) async => const Left(tServerFailure));
      },
      act: (cubit) => cubit.saveNote(),
      expect: () => [
        initialState.copyWith(allNotes: [Note.today], currentNote: Note.today)
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
}
