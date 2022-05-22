import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/notes/data/datasources/notes_local_data_source_impl.dart';
import 'package:looping_diary/utils/shared_prefs_keys.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../test_data.dart';
import '../../../../test_setup.dart';

void main() {
  late SharedPreferences _mockedSharedPreferences;
  late NotesLocalDataSourceImpl _notesLocalDataSource;

  setUpAll(baseSetup);

  setUp(() {
    _mockedSharedPreferences = MockSharedPreferences();
    _notesLocalDataSource = NotesLocalDataSourceImpl(_mockedSharedPreferences);
  });

  group('saveNote', () {
    test(
      'should make a call to sharedPreferences.setString',
      () async {
        // arrange
        when(() => _mockedSharedPreferences.setString(captureAny(), captureAny())).thenAnswer((_) async => true);

        // act
        await _notesLocalDataSource.saveNote(tNoteDTO);

        // assert
        verify(() => _mockedSharedPreferences.getString(SharedPrefsKeys.allNotes()));
        verify(() => _mockedSharedPreferences.setString(SharedPrefsKeys.allNotes(), jsonEncode([tNoteDTO]))).called(1);
        verifyNoMoreInteractions(_mockedSharedPreferences);
      },
    );
  });
}
