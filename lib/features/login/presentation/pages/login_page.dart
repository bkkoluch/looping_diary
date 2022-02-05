import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:looping_diary/core/localizer/localizer.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/illustrations.dart';
import 'package:looping_diary/features/common/widgets/faded_backgroud.dart';
import 'package:looping_diary/secrets/keys.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FadedBackground(
        imagePath: Illustrations.morningCoffeeWithDiary,
        child: SignInScreen(
          subtitleBuilder: (context, action) => Padding(
            padding: const EdgeInsets.only(bottom: CoreDimensions.paddingM),
            child: Text(localize(context).loginScreenTitle),
          ),
          providerConfigs: const [
            EmailProviderConfiguration(),
            GoogleProviderConfiguration(clientId: Keys.googleClientId)
          ],
        ),
      );
}
