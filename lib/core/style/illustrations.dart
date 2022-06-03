import 'package:looping_diary/res/painters/icons/info_icon_painter.dart';
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
  static const String newNote = '${iconPath}new_note.png';

  // Illustrations
  static const String morningCoffeeWithDiary = '${illustrationPath}morning_coffee_with_diary.jpg';
  static const String notes = '${illustrationPath}notes.svg';
  static const String addNotes = '${illustrationPath}add_notes.svg';
  static const String notebook = '${illustrationPath}notebook.svg';
  static const String personalNotebook = '${illustrationPath}personal_notebook.svg';
  static const String takingNotes = '${illustrationPath}taking_notes.svg';
}

class PainterTokens {
  // Icons
  static const iconInfo = InfoIconPainter();

  // Illustrations
  static const addNotes = AddNotesIllustrationPainter();
  static const notebook = NotebookIllustrationPainter();
  static const notes = NotesIllustrationPainter();
  static const personalNotebook = PersonalNotebookIllustrationPainter();
  static const takingNotes = TakingNotesIllustrationPainter();
}
