import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/design_tokens/text_tokens.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_painter_image.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';
import 'package:looping_diary/features/notes/utils/note_helper.dart' as note_helper;
import 'package:looping_diary/res/painters/notebook_painters/empty_notebook_painter.dart';
import 'package:looping_diary/res/strings.dart';

class EmptyNoteCard extends StatelessWidget {
  const EmptyNoteCard({required this.pageIndex, required this.pageViewController, Key? key}) : super(key: key);

  final int pageIndex;
  final PageController pageViewController;

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.zero,
        child: Stack(
          children: [
            CorePainterImage.sized(
              width: context.screenWidth,
              height: context.screenHeight,
              painter: EmptyNotebookPainter(pageIndex),
            ),
            _buildEmptyNoteDate(context),
            _buildEmptyNoteContent(context),
            _buildFoldedCornerGestureDetector(context),
          ],
        ),
      );

  Widget _buildEmptyNoteDate(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          right: note_helper.isPageEven(pageIndex) ? CoreDimensions.paddingS : 0,
          left: note_helper.isPageEven(pageIndex) ? 0 : CoreDimensions.paddingS,
        ),
        child: Align(
          alignment: note_helper.isPageEven(pageIndex) ? Alignment.topRight : Alignment.topLeft,
          child: Column(
            children: [
              SizedBox(height: context.screenHeight * 0.05),
              Text(emptyNoteNoteDate.toReadableDate, style: TextTokens.titleLg(context: context)),
            ],
          ),
        ),
      );

  Widget _buildEmptyNoteContent(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          right: note_helper.isPageEven(pageIndex) ? CoreDimensions.paddingXS : 0,
          left: note_helper.isPageEven(pageIndex) ? 0 : CoreDimensions.paddingXS,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.screenHeight * 0.11),
            Text(
              emptyNotePageAddNewNoteText.tr(),
              textAlign: note_helper.isPageEven(pageIndex) ? TextAlign.right : TextAlign.left,
              style: TextTokens.titleMd(context: context),
            ),
            // To remove
            Center(
              child: ElevatedButton(
                onPressed: getIt<FirebaseAuth>().signOut,
                child: const Text('Log out'),
              ),
            )
          ],
        ),
      );

  Widget _buildFoldedCornerGestureDetector(BuildContext context) => Align(
        alignment: note_helper.isPageEven(pageIndex) ? Alignment.bottomRight : Alignment.bottomLeft,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => _pushNoteDetailsPageAndScrollToNoteWhenPopped(context),
          child: SizedBox(
            width: context.screenWidth * 0.18,
            height: context.screenHeight * 0.1,
          ),
        ),
      );

  void _pushNoteDetailsPageAndScrollToNoteWhenPopped(BuildContext context) => context.router
          .push(
        NoteDetailsRoute(
          pageIndex: pageIndex,
          note: Note(
            noteDate: emptyNoteNoteDate,
            id: emptyNoteNoteDate.toDateTime.toIso8601String(),
          ),
        ),
      )
          .whenComplete(() {
        if (pageViewController.hasClients) {
          pageViewController.jumpToPage(pageIndex);
        }
      });

  NoteDate get emptyNoteNoteDate => note_helper.getNoteDateFromPageIndex(pageIndex);
}
