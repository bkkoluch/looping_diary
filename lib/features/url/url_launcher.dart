import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/analytics/crash_reporting_service.dart';
import 'package:looping_diary/core/ui/snack_bar.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_snackbar.dart';
import 'package:looping_diary/res/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> openUrl({
    required BuildContext context,
    required String url,
  }) async {
    final parsedUri = Uri.tryParse(url);
    if (parsedUri != null && await canLaunchUrl(parsedUri)) {
      await launchUrl(
        parsedUri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      getIt<CrashReportingService>().logError('UrlLauncher.openUrl(context,$url', stackTrace: StackTrace.current);
      showNotificationSnackBar(CoreSnackBar.information(text: settingsPageUrlLauncherErrorSnackBarText.tr()));
    }
  }

  static void openEmail({required BuildContext context, required String emailAddress}) {
    UrlLauncher.openUrl(context: context, url: Uri(scheme: 'mailto', path: emailAddress).toString());
  }

  static void openEmailAsHtml({
    required BuildContext context,
    required String emailAddress,
    required String subject,
    required String body,
    VoidCallback? onFailure,
    VoidCallback? onSuccess,
  }) async {
    final Email email = Email(
      recipients: [emailAddress],
      body: body,
      subject: subject,
      isHTML: true,
    );
    try {
      await FlutterEmailSender.send(email);
      onSuccess?.call();
    } catch (error) {
      onFailure?.call();
    }
  }
}
