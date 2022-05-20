import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:looping_diary/core/localizer/flutter_fire_ui_custom_delegate.dart';

List<LocalizationsDelegate> localizationsDelegates(BuildContext context) => [
      FlutterFireUICustomDelegate(context),
      FlutterFireUILocalizations.delegate,
      ...context.localizationDelegates,
    ];

const List<Locale> supportedLocales = [Locale('en'), Locale('pl')];
