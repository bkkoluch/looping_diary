import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_text_field.dart';
import 'package:looping_diary/features/notes/presentation/cubits/cubit.dart';
import 'package:looping_diary/features/notes/presentation/pages/note_details_page.dart';
import 'package:looping_diary/features/notes/presentation/widgets/notebook_stack.dart';

import '../../../../test_data.dart';
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
    'should display NoteDetailsPage correctly',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(const NoteDetailsPage(note: tNote, pageIndex: 0));

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byType(NotebookStack), findsOneWidget);
      expect(find.byType(CoreTextField), findsOneWidget);
    },
  );
}
