import 'package:flutter/material.dart';
import 'package:ld_ui/ld_ui.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/res/painters/notebook_painters/bookmark_painter.dart';

class NoteBookmark extends StatefulWidget {
  const NoteBookmark({
    required this.listScrollController,
    required this.onPageScrolled,
    required this.note,
    required this.firstNoteOnTheList,
    required this.pageIndex,
    required this.noteIndex,
    required this.color,
    Key? key,
  }) : super(key: key);

  final ScrollController listScrollController;
  final VoidCallback onPageScrolled;
  final Note note;
  final Note firstNoteOnTheList;
  final int pageIndex;
  final int noteIndex;
  final Color color;

  @override
  State<NoteBookmark> createState() => _NoteBookmarkState();
}

class _NoteBookmarkState extends State<NoteBookmark> {
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    if (widget.noteIndex == 0) {
      _setActive(true);
    }
  }

  @override
  void didUpdateWidget(NoteBookmark oldWidget) {
    super.didUpdateWidget(oldWidget);
    _resetActiveBookmarkAndActiveCurrent();
  }

  @override
  Widget build(BuildContext context) => Container(
        color: ColorTokens.transparent,
        padding: const EdgeInsets.symmetric(vertical: CoreDimensions.paddingXS),
        child: Align(
          alignment: _isPageEven ? Alignment.bottomRight : Alignment.bottomLeft,
          child: Stack(
            children: [
              RotatedBox(
                quarterTurns: _isPageEven ? 2 : 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  width: _bookmarkWidth(context),
                  child: LDPainterImage.sized(
                    width: _bookmarkWidth(context),
                    height: CoreDimensions.lastYearBookmarkHeight,
                    painter: BookmarkPainter(widget.color),
                  ),
                ),
              ),
              PositionedDirectional(
                end: context.screenWidth * 0.01,
                start: _isPageEven ? null : context.screenWidth * 0.01,
                top: context.screenWidth * 0.005,
                child: Text(
                  widget.note.noteDate.year.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              // Used to increase tap area
              PositionedDirectional(
                end: 0,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => _animateToNote(context),
                  child: Container(
                    color: ColorTokens.transparent,
                    width: _bookmarkWidth(context) * 3,
                    height: CoreDimensions.lastYearBookmarkHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  void _animateToNote(BuildContext context) => widget.listScrollController
      .animateTo(
        widget.noteIndex * context.screenHeight,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      )
      .whenComplete(() => widget.onPageScrolled());

  void _resetActiveBookmarkAndActiveCurrent() {
    _setActive(false);
    if ((widget.listScrollController.offset / context.screenHeight).floor() == widget.noteIndex) {
      _setActive(true);
    }
  }

  void _setActive(bool active) => setState(() => isActive = active);

  double _bookmarkWidth(BuildContext context) => isActive
      ? context.screenWidth * 0.25 + CoreDimensions.lastYearActiveBookmarkAdditionalWidth
      : context.screenWidth * 0.25;

  bool get _isPageEven => widget.pageIndex % 2 == 0;
}
