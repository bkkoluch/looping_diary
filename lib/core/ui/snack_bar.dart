import 'package:flutter/material.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/core/style/design_tokens/shadow_design_tokens.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_snackbar.dart';
import 'package:overlay_support/overlay_support.dart';

const int _defaultDuration = 3;

void showNotificationSnackBar(
  CoreSnackBar coreMessage, {
  Duration duration = const Duration(seconds: _defaultDuration),
  bool slideDismiss = true,
  bool autoDismiss = true,
  String? notificationKeyString,
}) {
  showSimpleNotification(
    Material(
      type: MaterialType.transparency,
      child: Container(
        child: coreMessage,
        margin: const EdgeInsets.all(CoreDimensions.paddingL),
        decoration: BoxDecoration(
          boxShadow: const [ShadowDesignTokens.elevation2to2Shadow],
          borderRadius: BorderRadiusDirectional.circular(CoreDimensions.coreSnackBarBorderRadius),
        ),
      ),
    ),
    elevation: 0,
    duration: duration,
    autoDismiss: autoDismiss,
    position: NotificationPosition.bottom,
    contentPadding: EdgeInsets.zero,
    background: ColorTokens.transparent,
    foreground: ColorTokens.transparent,
    slideDismissDirection: slideDismiss ? DismissDirection.horizontal : DismissDirection.none,
    key: notificationKeyString != null ? ModalKey(notificationKeyString) : ModalKey('defaultModalKey'),
  );
}
