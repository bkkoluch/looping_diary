import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ld_ui/ld_ui.dart';
import 'package:looping_diary/res/strings.dart';

class BasicInfoDialog {
  Future<void> show({required BuildContext context}) async => await AwesomeDialog(
        context: context,
        animType: AnimType.TOPSLIDE,
        dialogBackgroundColor: ColorTokens.beige,
        dismissOnTouchOutside: false,
        btnOkText: basicInfoDialogOkButtonText.tr(),
        btnOkOnPress: () {},
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: CoreDimensions.paddingL),
          child: Column(
            children: [
              LDText.titleMd(basicInfoDialogTitle.tr()),
              const SizedBox(height: CoreDimensions.spacingL),
              LDText.body(basicInfoDialogSubtitle.tr()),
            ],
          ),
        ),
      ).show();
}
