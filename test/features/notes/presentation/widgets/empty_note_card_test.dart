import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_painter_image.dart';
import 'package:looping_diary/features/notes/presentation/widgets/empty_note_card.dart';
import 'package:looping_diary/res/painters/bookmark_painter.dart';

import '../../../../test_setup.dart';

void main() {
  setUpAll(baseSetup);

  testWidgets(
    'should display EmptyNoteCard correctly',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(const EmptyNoteCard(pageIndex: 52));

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Text), findsNWidgets(2));
      expect(find.byType(CorePainterImage), findsOneWidget);
    },
  );
}
