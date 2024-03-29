import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ld_ui/ld_ui.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_bookmark.dart';

import '../../../../test_data.dart';
import '../../../../test_setup.dart';

void main() {
  testWidgets(
    'should display NoteBookmark correctly',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(
        NoteBookmark(
          listScrollController: ScrollController(),
          onPageScrolled: () {},
          note: tNote,
          firstNoteOnTheList: tNote,
          pageIndex: 0,
          noteIndex: 0,
          color: ColorTokens.scarletRed,
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byType(PositionedDirectional), findsNWidgets(2));
      expect(find.byType(RotatedBox), findsOneWidget);
      expect(find.byType(LDPainterImage), findsOneWidget);
      expect(find.byType(GestureDetector), findsOneWidget);
    },
  );
}
