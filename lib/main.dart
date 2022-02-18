import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/localizer/localizer.dart';
import 'package:looping_diary/firebase_options.dart';
import 'package:looping_diary/looping_diary_app.dart';
import 'package:looping_diary/utils/constants.dart';

Future<void> main() async {
  configureInjector();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    EasyLocalization(
      path: translationFolderPath,
      supportedLocales: supportedLocales,
      child: LoopingDiaryApp(),
    ),
  );
}
