import 'package:looping_diary/core/errors/failures.dart';
import 'package:looping_diary/features/notes/data/dtos/note_date_dto.dart';
import 'package:looping_diary/features/notes/data/dtos/note_dto.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';

// Strings
const String tId = '1';
const String tEntry = 'Some test string';
const String tLongEntry =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sagittis lectus nec magna lacinia, in scelerisque neque consequat. Fusce ultrices nulla libero, id viverra arcu commodo ac. Fusce et accumsan nunc. Donec a consequat turpis. Proin lorem turpis, ultrices non porta et, elementum eu felis. Donec efficitur eget arcu id placerat. Proin laoreet leo id magna molestie pellentesque. Nullam a purus consequat, tristique tellus non, posuere risus. Curabitur non massa ut urna aliquam sodales sit amet quis odio. Nullam accumsan nisi nisi, quis mollis ante placerat a. Vestibulum in justo vel tortor tristique ultricies. Nunc vitae metus eleifend, laoreet enim in, pretium ex. Praesent pharetra malesuada nisi ullamcorper interdum. Aenean iaculis posuere augue id iaculis. Maecenas et ipsum in lacus mollis sodales nec in lectus. Donec ut erat pulvinar ex condimentum blandit eget vitae nisi. Pellentesque quis orci in erat elementum viverra. Cras lacinia, nisi vitae imperdiet viverra, sem mauris venenatis velit, et consequat eros arcu eget turpis. Quisque at auctor erat. Maecenas sed leo sed ante auctor rutrum. Cras tincidunt ultrices velit non pellentesque. Sed vitae mi a ex gravida interdum viverra non erat. Aliquam dictum nibh metus, non imperdiet dui semper nec.';

// Errors
const ServerFailure tServerFailure = ServerFailure('Error');

// Notes
const NoteDate tNoteDate = NoteDate(day: 1, month: 12, year: 2020);
const NoteDateDTO tNoteDateDTO = NoteDateDTO(day: 1, month: 12, year: 2020);

const Note tNote = Note(id: tId, entry: tEntry, noteDate: tNoteDate);
const Note tLongEntryNote = Note(id: tId, entry: tLongEntry, noteDate: tNoteDate);

const NoteDTO tNoteDTO = NoteDTO(id: tId, entry: tEntry, noteDate: tNoteDateDTO);
