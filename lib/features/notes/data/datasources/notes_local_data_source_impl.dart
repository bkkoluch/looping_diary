import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/extensions/list_extensions.dart';
import 'package:looping_diary/features/notes/data/datasources/notes_local_data_source.dart';
import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';
import 'package:looping_diary/utils/shared_prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: NotesLocalDataSource)
class NotesLocalDataSourceImpl implements NotesLocalDataSource {
  NotesLocalDataSourceImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> saveNote(NoteDto note) async {
    final List<NoteDto> allNotes = getAllNotes();
    allNotes.addOrUpdateIfExists(allNotes, note);
    await saveAllNotes(allNotes);
  }

  @override
  NoteDto? getNote(NoteDateDto noteDate) {
    final String? noteString = _sharedPreferences.getString(SharedPrefsKeys.note(noteDate));
    return noteString == null ? null : NoteDto.fromJson(json.decode(noteString));
  }

  @override
  Future<void> saveAllNotes(List<NoteDto> allNotes) async {
    await _sharedPreferences.setString(SharedPrefsKeys.allNotes(), jsonEncode(allNotes));
  }

  @override
  List<NoteDto> getAllNotes() {
    final String? allNotesString = _sharedPreferences.getString(SharedPrefsKeys.allNotes());
    if (allNotesString != null) {
      final List<NoteDto> allNotes = (jsonDecode(allNotesString) as List).map((e) => NoteDto.fromJson(e)).toList();
      return allNotes;
    } else {
      return [];
    }
  }
}
