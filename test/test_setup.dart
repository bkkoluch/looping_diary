import 'package:flutter/material.dart';
import 'package:looping_diary/core/localizer/localizer.dart';

import 'firebase_test_setup.dart';

Widget prepareTestableWidget(Widget child) => MaterialApp(
      locale: const Locale('en'),
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
      home: child,
    );

void baseSetup() {
  setupFirebaseAuthMocks();
}
