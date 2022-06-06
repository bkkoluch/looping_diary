import 'package:bloc_test/bloc_test.dart';
import 'package:looping_diary/features/notes/data/data_sources/notes_local_data_source.dart';
import 'package:looping_diary/features/notes/data/data_sources/notes_remote_data_source.dart';
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart';
import 'package:looping_diary/features/notes/domain/use_cases/delete_note_use_case.dart';
import 'package:looping_diary/features/notes/domain/use_cases/get_all_notes_use_case.dart';
import 'package:looping_diary/features/notes/domain/use_cases/save_note_use_case.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_cubit.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_state.dart';
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:looping_diary/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:looping_diary/features/onboarding/domain/use_cases/get_onboarding_seen_use_case.dart';
import 'package:looping_diary/features/onboarding/domain/use_cases/mark_onboarding_as_seen_use_case.dart';
import 'package:looping_diary/features/user/data/data_sources/user_local_data_source.dart';
import 'package:mocktail/mocktail.dart';

// Cubits

class MockNoteCubit extends MockCubit<NoteState> implements NoteCubit {}

// Use cases

class MockGetAllNotesUseCase extends Mock implements GetAllNotesUseCase {}

class MockSaveNoteUseCase extends Mock implements SaveNoteUseCase {}

class MockDeleteNoteUseCase extends Mock implements DeleteNoteUseCase {}

class MockMarkOnboardingAsSeenUseCase extends Mock implements MarkOnboardingAsSeenUseCase {}

class MockGetOnboardingSeenUseCase extends Mock implements GetOnboardingSeenUseCase {}

// Repositories

class MockNotesRepository extends Mock implements NotesRepository {}

class MockOnboardingRepository extends Mock implements OnboardingRepository {}

// Data sources

class MockUserLocalDataSource extends Mock implements UserLocalDataSource {}

class MockNotesLocalDataSource extends Mock implements NotesLocalDataSource {}

class MockNotesRemoteDataSource extends Mock implements NotesRemoteDataSource {}

class MockOnboardingLocalDataSource extends Mock implements OnboardingLocalDataSource {}
