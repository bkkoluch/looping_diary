import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_painter_image.dart';
import 'package:looping_diary/features/notes/presentation/widgets/notebook_stack.dart';
import 'package:looping_diary/res/painters/notebook_painter.dart';

import '../../../../test_setup.dart';

void main() {
  testWidgets(
    'should display NotebookStack correctly',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(NotebookStack(pageIndex: 24, child: Container()));

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byType(Stack), findsOneWidget);
      expect(find.byType(CorePainterImage), findsOneWidget);
    },
  );
}
