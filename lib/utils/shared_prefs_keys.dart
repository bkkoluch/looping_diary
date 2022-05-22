import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';

class SharedPrefsKeys {
  // Onboarding
  static String onboardingSeen() => 'sharedPrefsKeyOnboardingSeen';

  // Notes
  static String note(NoteDateDTO noteDate) => 'sharedPrefsKeyNote$noteDate';

  static String allNotes() => 'sharedPrefsKeyAllNotes';
}
