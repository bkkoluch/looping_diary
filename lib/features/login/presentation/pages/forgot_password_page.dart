import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/illustrations.dart';
import 'package:looping_diary/features/common/presentation/widgets/flutterfire_ui_image_stack_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FlutterFireUiImageStackPage(
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
