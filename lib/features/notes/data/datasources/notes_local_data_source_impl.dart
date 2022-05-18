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
    allNotes.addOrUpdateIfExists(
      allNotes,
      () => allNotes.indexWhere((n) => n.noteDate == note.noteDate),
      note,
    );
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
      // Using [e as Map<String, dynamic>] casting which is unnecessary, but it let's me avoid
      // 'Don't create a lambda when a tear-off will do' bug for dynamic types
      final List<NoteDto> allNotes = (jsonDecode(allNotesString) as List)
          .map((e) => NoteDto.fromJson(e as Map<String, dynamic>))
          .toList()
        ..sort((a, b) => a.noteDate.toDateTime.compareTo(b.noteDate.toDateTime));

      return allNotes;
    } else {
      return [];
    }
  }
}
