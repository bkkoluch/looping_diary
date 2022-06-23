import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ld_ui/ld_ui.dart';
import 'package:looping_diary/features/notes/presentation/widgets/empty_note_card.dart';
import 'package:looping_diary/features/notes/utils/note_helper.dart';

import '../../../../test_setup.dart';

void main() {
  setUpAll(baseSetup);

  const int pageIndex = 52;

  testWidgets(
    'should display EmptyNoteCard correctly',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(
        EmptyNoteCard(
          pageIndex: pageIndex,
          pageViewController: PageController(),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(LDPainterImage), findsOneWidget);
      expect(find.text(getNoteDateFromPageIndex(pageIndex).toReadableDate), findsOneWidget);
    },
  );
}
