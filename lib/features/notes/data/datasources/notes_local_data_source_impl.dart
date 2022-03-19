import 'dart:convert';

import 'package:looping_diary/features/notes/data/datasources/notes_local_data_source.dart';
import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';
import 'package:looping_diary/utils/shared_prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesLocalDataSourceImpl implements NotesLocalDataSource {
  NotesLocalDataSourceImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> saveNote(NoteDto note) async {
    await _sharedPreferences.setString(SharedPrefsKeys.note(note.noteDate), note.toString());
  }

  @override
  NoteDto? getNote(NoteDateDto noteDate) {
    final String? noteString = _sharedPreferences.getString(SharedPrefsKeys.note(noteDate));
    return noteString == null ? null : NoteDto.fromJson(json.decode(noteString));
  }
}
