import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/localizer/localizer.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/themed_data.dart';

class LoopingDiaryApp extends StatelessWidget {
  LoopingDiaryApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Looping Diary',
        theme: ThemedData.lightThemeData,
        localizationsDelegates: localizationsDelegates(context),
        supportedLocales: context.supportedLocales,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      );
}
