import 'package:bloc_test/bloc_test.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_cubit.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_state.dart';

class MockNoteCubit extends MockCubit<NoteState> implements NoteCubit {}
