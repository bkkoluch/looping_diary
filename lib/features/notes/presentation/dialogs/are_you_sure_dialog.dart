import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/res/strings.dart';

class AreYouSureDialog {
  Future<void> show({required BuildContext context}) async => await AwesomeDialog(
        context: context,
        animType: AnimType.BOTTOMSLIDE,
        dialogType: DialogType.WARNING,
        dialogBackgroundColor: ColorTokens.beige,
        dismissOnTouchOutside: false,
        title: areYouSureDialogTitle.tr(),
        desc: areYouSureDialogSubtitle.tr(),
        btnCancelText: areYouSureDialogCancelButtonText.tr(),
        btnOkText: areYouSureDialogOkButtonText.tr(),
        btnCancelOnPress: () {},
        btnOkOnPress: () => context.router.pop(),
      ).show();
}
