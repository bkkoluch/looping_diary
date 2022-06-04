import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_painter_image.dart';
import 'package:looping_diary/features/notes/utils/note_helper.dart' as note_helper;
import 'package:looping_diary/res/painters/notebook_painters/notebook_painter.dart';

class NotebookStack extends StatelessWidget {
  const NotebookStack({required this.pageIndex, required this.child, Key? key}) : super(key: key);

  final int pageIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) => Stack(
        clipBehavior: Clip.none,
        children: [
          CorePainterImage.sized(
            width: context.screenWidth,
            height: context.screenHeight,
            painter: NotebookPainter(pageIndex),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: note_helper.isPageEven(pageIndex) ? CoreDimensions.noteCardStartPadding : CoreDimensions.paddingS,
              right: note_helper.isPageEven(pageIndex) ? CoreDimensions.paddingS : CoreDimensions.noteCardStartPadding,
            ),
            child: child,
          )
        ],
      );
}
