import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/res/strings.dart';

class DeleteNoteDialog {
  DeleteNoteDialog(this.onOkPressed);

  final VoidCallback onOkPressed;

  Future<void> show({required BuildContext context}) async => await AwesomeDialog(
        context: context,
        animType: AnimType.BOTTOMSLIDE,
        dialogType: DialogType.WARNING,
        dialogBackgroundColor: ColorTokens.beige,
        dismissOnTouchOutside: false,
        title: deleteNoteDialogTitle.tr(),
        desc: deleteNoteDialogSubtitle.tr(),
        btnOkText: deleteNoteDialogCancelButtonText.tr(),
        btnCancelText: deleteNoteDialogOkButtonText.tr(),
        btnOkOnPress: onOkPressed,
        btnCancelOnPress: () {},
      ).show();
}
