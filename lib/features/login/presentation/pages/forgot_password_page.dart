import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:ld_ui/ld_ui.dart';
import 'package:looping_diary/core/style/illustrations.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: LDFlutterFireUiImageStackPage(
          illustrationPath: Illustrations.forgotPassword,
          child: Padding(
            padding: const EdgeInsets.all(CoreDimensions.paddingL),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: context.screenHeight * 0.1),
                child: const ForgotPasswordView(),
              ),
            ),
          ),
        ),
      );
}
