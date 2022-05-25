import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_painter_image.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';
import 'package:looping_diary/features/notes/utils/note_helper.dart';
import 'package:looping_diary/res/painters/empty_notebook_painter.dart';

class EmptyNoteCard extends StatelessWidget {
  const EmptyNoteCard({required this.pageIndex, Key? key}) : super(key: key);

  final int pageIndex;

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: CoreDimensions.spacingMXL),
                Center(
                  child: Text(
                    pageIndexToDayAndMonth(pageIndex),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                const SizedBox(height: CoreDimensions.spacingMXL),
                // To remove
                Center(
                  child: ElevatedButton(
                    onPressed: getIt<FirebaseAuth>().signOut,
                    child: const Text('Log out'),
                  ),
                )
              ],
            ),
            Align(
              alignment: isPageEven ? Alignment.bottomRight : Alignment.bottomLeft,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => _pushAddNotePageAndRebuildWhenPopped(context),
                child: SizedBox(
                  width: context.screenWidth * 0.18,
                  height: context.screenHeight * 0.1,
                ),
              ),
            )
          ],
        ),
      );

  void _pushAddNotePageAndRebuildWhenPopped(BuildContext context) => context.router.push(
        AddNoteRoute(
          noteToAddOrEdit: Note(
            noteDate: emptyNoteNoteDate,
            id: emptyNoteNoteDate.toDateTime.toIso8601String(),
          ),
        ),
      );

  bool get isPageEven => pageIndex % 2 == 0;

  NoteDate get emptyNoteNoteDate => NoteDate(day: day, month: month, year: DateTime.now().year);

  int get day => int.tryParse(pageIndexToDayAndMonth(pageIndex).split('/')[0])!;

  int get month => int.tryParse(pageIndexToDayAndMonth(pageIndex).split('/')[1])!;
}
