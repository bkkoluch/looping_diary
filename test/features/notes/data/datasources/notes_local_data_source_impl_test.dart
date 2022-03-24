import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/notes/data/datasources/notes_local_data_source_impl.dart';
import 'package:looping_diary/utils/shared_prefs_keys.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../test_data.dart';
import '../../../../test_setup.dart';

class MockedSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences _mockedSharedPreferences;
  late NotesLocalDataSourceImpl _notesLocalDataSource;

  setUpAll(baseSetup);

  setUp(() {
    _mockedSharedPreferences = MockedSharedPreferences();
    _notesLocalDataSource = NotesLocalDataSourceImpl(_mockedSharedPreferences);
  });

  group('saveNote', () {
    test(
      'should make a call to sharedPreferences.setString',
      () async {
        // arrange
        when(() => _mockedSharedPreferences.setString(captureAny(), captureAny())).thenAnswer((_) async => true);

        // act
        await _notesLocalDataSource.saveNote(tNoteDto);

        // assert
        verify(() => _mockedSharedPreferences.setString(SharedPrefsKeys.note(tNoteDto.noteDate), tNoteDto.toString()))
            .called(1);
        verifyNoMoreInteractions(_mockedSharedPreferences);
      },
    );
  });

  group('getNote', () {
    test(
      'should return NoteDto and make a call to sharedPreferences.getString if a value was saved in prefs',
      () {
        // arrange
        when(() => _mockedSharedPreferences.getString(captureAny())).thenAnswer((_) => json.encode(tNoteDto));

        // act
        final result = _notesLocalDataSource.getNote(tNoteDto.noteDate);

        // assert
        expect(result, tNoteDto);
        verify(() => _mockedSharedPreferences.getString(SharedPrefsKeys.note(tNoteDto.noteDate))).called(1);
        verifyNoMoreInteractions(_mockedSharedPreferences);
      },
    );

    test(
      'should return null if value was not saved in prefs',
      () {
        // arrange
        when(() => _mockedSharedPreferences.getString(captureAny())).thenAnswer((_) => null);

        // act
        final result = _notesLocalDataSource.getNote(tNoteDto.noteDate);

        // assert
        expect(result, null);
        verify(() => _mockedSharedPreferences.getString(SharedPrefsKeys.note(tNoteDto.noteDate))).called(1);
        verifyNoMoreInteractions(_mockedSharedPreferences);
      },
    );
  });
}