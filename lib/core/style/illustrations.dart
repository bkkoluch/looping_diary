import 'package:looping_diary/res/painters/icons/back_icon_painter.dart';
import 'package:looping_diary/res/painters/icons/calendar_icon_painter.dart';
import 'package:looping_diary/res/painters/icons/delete_note_icon_painter.dart';
import 'package:looping_diary/res/painters/icons/edit_note_icon_painter.dart';
import 'package:looping_diary/res/painters/icons/info_alternate_icon_painter.dart';
import 'package:looping_diary/res/painters/icons/info_icon_painter.dart';
import 'package:looping_diary/res/painters/icons/keyboard_hide_icon_painter.dart';
import 'package:looping_diary/res/painters/icons/keyboard_show_icon_painter.dart';
import 'package:looping_diary/res/painters/icons/save_note_icon_painter.dart';
import 'package:looping_diary/res/painters/icons/settings_icon_painter.dart';
import 'package:looping_diary/res/painters/illustrations/add_notes_illustration_painter.dart';
import 'package:looping_diary/res/painters/illustrations/notebook_illustration_painter.dart';
import 'package:looping_diary/res/painters/illustrations/notes_illustration_painter.dart';
import 'package:looping_diary/res/painters/illustrations/personal_notebook_illustration_painter.dart';
import 'package:looping_diary/res/painters/illustrations/taking_notes_illustration_painter.dart';

const String illustrationPath = 'lib/res/images/';
const String iconPath = 'lib/res/icons/';

class Illustrations {
  // Icons
  static const String home = '${iconPath}home.png';
  static const String settings = '${iconPath}settings.png';

  // Illustrations
  static const String notes = '${illustrationPath}notes.svg';
  static const String addNotes = '${illustrationPath}add_notes.svg';
  static const String notebook = '${illustrationPath}notebook.svg';
  static const String personalNotebook = '${illustrationPath}personal_notebook.svg';
  static const String takingNotes = '${illustrationPath}taking_notes.svg';
  static const String noConnection = '${illustrationPath}no_connection.svg';
  static const String profilePicture = '${illustrationPath}profile_picture.svg';
  static const String mobileLogin = '${illustrationPath}mobile_login.svg';
  static const String forgotPassword = '${illustrationPath}forgot_password.svg';
}

class PainterTokens {
  // Icons
  static const iconInfo = InfoIconPainter();
  static const iconDeleteNote = DeleteNoteIconPainter();
  static const iconSaveNote = SaveNoteIconPainter();
  static const iconCalendar = CalendarIconPainter();
  static const iconBack = BackIconPainter();
  static const iconKeyboardShow = KeyboardShowIconPainter();
  static const iconKeyboardHide = KeyboardHideIconPainter();
  static const iconEditNote = EditNoteIconPainter();
  static const iconInfoAlternate = InfoAlternateIconPainter();
  static const iconSettings = SettingsIconPainter();

  // Illustrations
  static const addNotes = AddNotesIllustrationPainter();
  static const notebook = NotebookIllustrationPainter();
  static const notes = NotesIllustrationPainter();
  static const personalNotebook = PersonalNotebookIllustrationPainter();
  static const takingNotes = TakingNotesIllustrationPainter();
}
