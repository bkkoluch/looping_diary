import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/injector.dart';
import 'package:looping_diary/firebase_options.dart';
import 'package:looping_diary/looping_diary_app.dart';

Future<void> main() async {
  configureInjector();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const LoopingDiaryApp());
}
