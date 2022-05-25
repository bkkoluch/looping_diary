import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_text_field.dart';
import 'package:looping_diary/features/notes/presentation/cubits/cubit.dart';
import 'package:looping_diary/features/notes/presentation/pages/note_details_page.dart';
import 'package:looping_diary/features/notes/presentation/widgets/notebook_stack.dart';

import '../../../../test_mocks.dart';
import '../../../../test_setup.dart';

void main() {
  setUpAll(() {
    getIt.registerFactory<NoteCubit>(MockNoteCubit.new);
    baseSetup();
  });

  testWidgets(
    'should display NoteDetailsPage correctly',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(const NoteDetailsPage());

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byType(NotebookStack), findsOneWidget);
      expect(find.byType(CoreTextField), findsOneWidget);
    },
  );
}
