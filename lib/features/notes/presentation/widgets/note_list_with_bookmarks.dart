import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_bookmark.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_card.dart';
import 'package:looping_diary/features/notes/utils/note_helper.dart' as note_helper;

class NoteListWithBookmarks extends StatefulWidget {
  const NoteListWithBookmarks({
    required this.onNoteTapped,
    required this.onPagesScrolled,
    required this.listScrollController,
    required this.pageIndex,
    required this.notesDividedByDay,
    Key? key,
  }) : super(key: key);

  final Function(BuildContext context, Note note, int pageIndex) onNoteTapped;
  final VoidCallback onPagesScrolled;
  final ScrollController listScrollController;
  final int pageIndex;
  final List<Note> notesDividedByDay;

  @override
  State<NoteListWithBookmarks> createState() => _NoteListWithBookmarksState();
}

class _NoteListWithBookmarksState extends State<NoteListWithBookmarks> {
  @override
  Widget build(BuildContext context) => Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.zero,
            controller: widget.listScrollController,
            physics: const ClampingScrollPhysics(),
            itemCount: widget.notesDividedByDay.length,
            itemBuilder: (_, int noteIndex) => Stack(
              clipBehavior: Clip.none,
              children: [
                NoteCard(note: widget.notesDividedByDay[noteIndex], pageIndex: widget.pageIndex),
                Align(
                  alignment: note_helper.isPageEven(widget.pageIndex) ? Alignment.topRight : Alignment.topLeft,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => widget.onNoteTapped(context, widget.notesDividedByDay[noteIndex], widget.pageIndex),
                    child: SizedBox(height: context.screenHeight * 0.5, width: context.screenWidth * 0.9),
                  ),
                ),
              ],
            ),
          ),
          if (widget.notesDividedByDay.length > 1)
            Positioned.fill(
              bottom: CoreDimensions.lastYearBookmarkHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ...widget.notesDividedByDay.map(
                    (note) => NoteBookmark(
                      listScrollController: widget.listScrollController,
                      onPageScrolled: widget.onPagesScrolled,
                      note: note,
                      firstNoteOnTheList: widget.notesDividedByDay.first,
                      pageIndex: widget.pageIndex,
                      noteIndex: widget.notesDividedByDay.indexOf(note),
                      color: bookmarkColors[widget.notesDividedByDay.indexOf(note) % bookmarkColors.length],
                    ),
                  )
                ],
              ),
            ),
        ],
      );
}
