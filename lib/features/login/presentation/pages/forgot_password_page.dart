import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/illustrations.dart';
import 'package:looping_diary/features/common/presentation/widgets/faded_backgroud.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const FadedBackground(
        imagePath: Illustrations.morningCoffeeWithDiary,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(CoreDimensions.paddingL),
            child: Center(child: ForgotPasswordView()),
          ),
        ),
      );
}
