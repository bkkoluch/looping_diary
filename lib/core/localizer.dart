import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutterfire_ui/i10n.dart';

AppLocalizations localize(BuildContext context) => AppLocalizations.of(context)!;

class LabelOverrides extends DefaultLocalizations {
  const LabelOverrides();

  @override
  String get emailInputLabel => 'Enter your email';

  @override
  String get passwordInputLabel => 'Enter your password';
}
