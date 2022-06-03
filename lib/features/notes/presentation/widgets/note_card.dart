import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/style/design_tokens/text_tokens.dart';
import 'package:looping_diary/features/common/presentation/widgets/note_content.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/presentation/widgets/notebook_stack.dart';
import 'package:looping_diary/features/notes/utils/note_helper.dart' as note_helper;

const double _minimumNoteEntryFontSize = 18;

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
          child: NoteContent(
            noteDate: note.noteDate,
            pageIndex: pageIndex,
            noteEntryWidget: Column(
              children: [
                SizedBox(height: context.screenHeight * 0.11),
                AutoSizeText(
                  note.entry ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: note_helper.numberOfNotebookLinesOnAPage,
                  style: TextTokens.bodyLg(context: context),
                  minFontSize: _minimumNoteEntryFontSize,
                ),
              ],
            ),
          ),
        ),
      );
}
