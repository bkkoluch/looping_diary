import 'package:flutter/material.dart';
import 'package:ld_ui/ld_ui.dart';
import 'package:looping_diary/features/notes/utils/note_helper.dart' as note_helper;

class NotePageOverlay extends StatefulWidget {
  const NotePageOverlay({
    required this.underneathNotePage,
    required this.pageIndex,
    required this.quickActionsColumn,
    Key? key,
  }) : super(key: key);

  final Widget underneathNotePage;
  final int pageIndex;
  final Column quickActionsColumn;

  @override
  State<NotePageOverlay> createState() => _NotePageOverlayState();
}

class _NotePageOverlayState extends State<NotePageOverlay> {
  @override
  Widget build(BuildContext context) => Stack(
        children: [widget.underneathNotePage, _buildAboveLayerWithQuickActions()],
      );

  Widget _buildAboveLayerWithQuickActions() => Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: note_helper.isPageEven(widget.pageIndex) ? CoreDimensions.paddingXS : 0),
            width: note_helper.isPageEven(widget.pageIndex) ? _noteBookMarginWidth : _noteBookContentWidth,
            child: note_helper.isPageEven(widget.pageIndex) ? _buildQuickActionsColumn() : const SizedBox.shrink(),
          ),
          Container(
            padding: EdgeInsets.only(right: note_helper.isPageEven(widget.pageIndex) ? 0 : CoreDimensions.paddingXS),
            width: note_helper.isPageEven(widget.pageIndex) ? _noteBookContentWidth : _noteBookMarginWidth,
            child: note_helper.isPageEven(widget.pageIndex) ? const SizedBox.shrink() : _buildQuickActionsColumn(),
          ),
        ],
      );

  Widget _buildQuickActionsColumn() => widget.quickActionsColumn;

  double get _noteBookMarginWidth => context.screenWidth * 0.1;

  double get _noteBookContentWidth => context.screenWidth * 0.9;
}
