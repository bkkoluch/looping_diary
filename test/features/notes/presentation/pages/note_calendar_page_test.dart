import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/notes/presentation/cubits/cubit.dart';
import 'package:looping_diary/features/notes/presentation/pages/note_calendar_page.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../test_mocks.dart';
import '../../../../test_setup.dart';

void main() {
  setUpAll(() {
    final NoteCubit noteCubit = MockNoteCubit();
    getIt.registerFactory<NoteCubit>(() => noteCubit);

    whenListen(
      noteCubit,
      Stream.fromIterable([NoteState.initial().copyWith(status: NoteStateStatus.loaded)]),
      initialState: NoteState.initial(),
    );
    baseSetup();
  });

  testWidgets(
    'should display NoteCalendarPage correctly',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(const NoteCalendarPage());

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byType(TableCalendar), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    },
    skip: true,
  );
}
