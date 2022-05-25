import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/presentation/widgets/notebook_stack.dart';

const _numberOfNotebookLinesOnAPage = 16;

class NoteCard extends StatelessWidget {
  const NoteCard({
    required this.note,
    required this.pageIndex,
    Key? key,
  }) : super(key: key);

  final Note note;
  final int pageIndex;

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.zero,
        child: NotebookStack(
          pageIndex: pageIndex,
          child: Padding(
            padding: EdgeInsets.only(
              left: isPageEven ? CoreDimensions.noteCardStartPadding : CoreDimensions.paddingS,
              right: isPageEven ? CoreDimensions.paddingS : CoreDimensions.noteCardStartPadding,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: isPageEven ? Alignment.topRight : Alignment.topLeft,
                  child: Column(
                    children: [
                      SizedBox(height: context.screenHeight * 0.05),
                      AutoSizeText(
                        note.noteDate.toReadableDate,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: context.screenHeight * 0.11),
                    AutoSizeText(
                      note.entry ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 16,
                      minFontSize: 18,
                      style: TextStyle(height: _textSize(context)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  bool get isPageEven => pageIndex % 2 == 0;

  double _textSize(BuildContext context) {
    final screenHeightMultiplier = context.screenHeight * 0.01;
    final singleLinesHeightFactor = _numberOfNotebookLinesOnAPage / screenHeightMultiplier;
    final scaledTextHeight = 1.81 / singleLinesHeightFactor * 2.45;

    return scaledTextHeight;
  }
}
