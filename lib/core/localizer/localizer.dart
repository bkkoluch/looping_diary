import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:looping_diary/core/localizer/flutter_fire_ui_custom_delegate.dart';

final List<LocalizationsDelegate> localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

FlutterFireUICustomDelegate customFlutterFireUIDelegate(BuildContext context) => FlutterFireUICustomDelegate(context);

const List<Locale> supportedLocales = AppLocalizations.supportedLocales;

AppLocalizations localize(BuildContext context) => AppLocalizations.of(context);

Locale currentLocale(BuildContext context) => Locale(localize(context).localeName);
