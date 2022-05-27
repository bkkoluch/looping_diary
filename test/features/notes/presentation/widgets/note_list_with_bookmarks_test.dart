import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/notes/presentation/cubits/cubit.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_bookmark.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_card.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_list_with_bookmarks.dart';

import '../../../../test_data.dart';
import '../../../../test_mocks.dart';
import '../../../../test_setup.dart';

void main() {
  setUpAll(() => getIt.registerFactory<NoteCubit>(MockNoteCubit.new));

  testWidgets(
    'should display NoteListWithBookmarks correctly',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(
        NoteListWithBookmarks(
          onNoteTapped: (_, __, ___) {},
          onPagesScrolled: () {},
          listScrollController: ScrollController(),
          pageIndex: 0,
          notesDividedByDay: const [tNote, tNote],
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(NoteCard), findsOneWidget);
      expect(find.byType(NoteBookmark), findsNWidgets(2));
    },
  );
}
