import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/illustrations.dart';
import 'package:looping_diary/features/common/presentation/widgets/faded_backgroud.dart';
import 'package:looping_diary/res/strings.dart';
import 'package:looping_diary/secrets/keys.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(_) => FadedBackground(
        imagePath: Illustrations.morningCoffeeWithDiary,
        child: SignInScreen(
          actions: [_forgotPasswordAction],
          subtitleBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: CoreDimensions.paddingM),
            child: Text(loginScreenTitle.tr()),
          ),
          providerConfigs: const [
            EmailProviderConfiguration(),
            GoogleProviderConfiguration(clientId: Keys.googleClientId)
          ],
        ),
      );

  ForgotPasswordAction get _forgotPasswordAction =>
      ForgotPasswordAction((context, __) => context.router.push(const ForgotPasswordRoute()));
}
