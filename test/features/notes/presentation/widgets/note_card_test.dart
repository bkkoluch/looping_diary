import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_card.dart';
import 'package:looping_diary/features/notes/presentation/widgets/notebook_stack.dart';

import '../../../../test_data.dart';
import '../../../../test_setup.dart';

void main() {
  testWidgets(
    'should display NoteCard correctly',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(const NoteCard(note: tNote, pageIndex: 0));

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(NotebookStack), findsOneWidget);
      expect(find.byType(Column), findsNWidgets(2));
    },
  );
}
