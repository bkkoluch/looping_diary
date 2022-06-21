import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/core/style/design_tokens/text_tokens.dart';
import 'package:looping_diary/res/strings.dart';

class LeaveWithoutSavingNoteDialog {
  const LeaveWithoutSavingNoteDialog(this.btnCancelOnPress);

  final VoidCallback btnCancelOnPress;

  Future<void> show({required BuildContext context}) async => await AwesomeDialog(
        context: context,
        animType: AnimType.BOTTOMSLIDE,
        dialogType: DialogType.WARNING,
        dialogBackgroundColor: ColorTokens.beige,
        dismissOnTouchOutside: false,
        title: areYouSureDialogTitle.tr(),
        desc: areYouSureDialogSubtitle.tr(),
        titleTextStyle: TextTokens.titleSm(),
        descTextStyle: TextTokens.body(),
        btnOkText: areYouSureDialogOkButtonText.tr(),
        btnCancelText: areYouSureDialogCancelButtonText.tr(),
        btnOkOnPress: () {},
        btnCancelOnPress: btnCancelOnPress,
      ).show();
}
