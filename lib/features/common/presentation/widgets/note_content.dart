import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/style/design_tokens/text_tokens.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';
import 'package:looping_diary/features/notes/utils/note_helper.dart' as note_helper;

class NoteContent extends StatelessWidget {
  const NoteContent({
    required this.noteEntryWidget,
    required this.noteDate,
    required this.pageIndex,
    Key? key,
  }) : super(key: key);

  final Widget noteEntryWidget;
  final NoteDate noteDate;
  final int pageIndex;

  @override
  Widget build(BuildContext context) => Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: note_helper.isPageEven(pageIndex) ? Alignment.topRight : Alignment.topLeft,
            child: Column(
              children: [
                SizedBox(height: context.screenHeight * 0.05),
                AutoSizeText(noteDate.toReadableDate, style: TextTokens.titleLg(context: context)),
              ],
            ),
          ),
          noteEntryWidget,
        ],
      );
}
