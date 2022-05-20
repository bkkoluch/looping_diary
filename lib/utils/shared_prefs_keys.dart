import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';

class SharedPrefsKeys {
  // Notes
  static String note(NoteDateDTO noteDate) => 'sharedPrefsKeyNote$noteDate';

  static String allNotes() => 'sharedPrefsKeyAllNotes';
}
