import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ld_ui/ld_ui.dart';
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
        titleTextStyle: TextTokens.titleSm(),
        descTextStyle: TextTokens.body(),
        btnOkText: deleteNoteDialogOkButtonText.tr(),
        btnCancelText: deleteNoteDialogCancelButtonText.tr(),
        btnOkOnPress: onOkPressed,
        btnCancelOnPress: () {},
      ).show();
}
