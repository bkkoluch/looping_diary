import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:looping_diary/core/injector.dart';
import 'package:looping_diary/core/style/themed_data.dart';
import 'package:looping_diary/features/login/presentation/auth_gate.dart';
import 'package:looping_diary/firebase_options.dart';

Future<void> main() async {
  configureInjector();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const LoopingDiaryApp());
}

class LoopingDiaryApp extends StatelessWidget {
  const LoopingDiaryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Looping Diary',
        theme: ThemedData.lightThemeData,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('pl', ''),
        ],
        home: const AuthGate(),
      );
}
