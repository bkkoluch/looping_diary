import 'package:easy_localization/easy_localization.dart';
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
        localizationsDelegates: localizationsDelegates(context),
        supportedLocales: context.supportedLocales,
        home: const AuthGate(),
      );
}
