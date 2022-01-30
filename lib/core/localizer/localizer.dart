import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutterfire_ui/i10n.dart';

final List<LocalizationsDelegate> localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

const List<Locale> supportedLocales = [
  Locale('en', ''),
  Locale('pl', ''),
];

AppLocalizations localize(BuildContext context) => AppLocalizations.of(context);
