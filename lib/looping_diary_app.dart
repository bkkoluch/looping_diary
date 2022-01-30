import 'package:flutter/material.dart';
import 'package:looping_diary/core/localizer/localizer.dart';
import 'package:looping_diary/core/style/themed_data.dart';
import 'package:looping_diary/features/login/presentation/auth_gate.dart';

class LoopingDiaryApp extends StatelessWidget {
  const LoopingDiaryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Looping Diary',
        theme: ThemedData.lightThemeData,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        home: const AuthGate(),
      );
}
