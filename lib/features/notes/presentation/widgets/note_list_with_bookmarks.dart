import 'package:flutter/material.dart';
import 'package:looping_diary/core/style/color_tokens.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_bookmark.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_card.dart';

class NoteListWithBookmarks extends StatelessWidget {
  const NoteListWithBookmarks({
    required this.onNoteTapped,
    required this.onPagesScrolled,
    required this.listScrollController,
    required this.listIndex,
    required this.notesDividedByDay,
    Key? key,
  }) : super(key: key);

  final Function([Note? note]) onNoteTapped;
  final VoidCallback onPagesScrolled;
  final ScrollController listScrollController;
  final int listIndex;
  final List<Note> notesDividedByDay;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.zero,
            controller: listScrollController,
            physics: const ClampingScrollPhysics(),
            itemCount: notesDividedByDay.length,
            itemBuilder: (_, int noteIndex) => GestureDetector(
              onTap: () => onNoteTapped(notesDividedByDay[noteIndex]),
              child: NoteCard(note: notesDividedByDay[noteIndex], pageIndex: listIndex),
            ),
          ),
          if (notesDividedByDay.length > 1)
            Positioned.fill(
              bottom: CoreDimensions.lastYearBookmarkHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ...notesDividedByDay.map(
                    (note) => NoteBookmark(
                      listScrollController: listScrollController,
                      onPageScrolled: onPagesScrolled,
                      note: note,
                      firstNoteOnTheList: notesDividedByDay.first,
                      pageIndex: listIndex,
                      noteIndex: notesDividedByDay.indexOf(note),
                      color: bookmarkColors[notesDividedByDay.indexOf(note) % bookmarkColors.length],
                    ),
                  )
                ],
              ),
            ),
        ],
      );
}
