import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:looping_diary/core/localizer/flutter_fire_ui_localization_labels.dart';

class FlutterFireUICustomDelegate extends LocalizationsDelegate<FlutterFireUILocalizations> {
  const FlutterFireUICustomDelegate(this.context);

  final BuildContext context;

  @override
  bool isSupported(Locale locale) => context.supportedLocales.contains(locale);

  @override
  Future<FlutterFireUILocalizations> load(Locale locale) => SynchronousFuture<FlutterFireUILocalizations>(
        FlutterFireUILocalizations(locale, const FlutterFireUICustomLocalizationLabels()),
      );

  @override
  bool shouldReload(FlutterFireUICustomDelegate old) => false;
}
