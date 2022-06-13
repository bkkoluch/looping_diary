import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/core/style/illustrations.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_button.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_text.dart';
import 'package:looping_diary/res/strings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorTokens.brown,
        appBar: AppBar(
          backgroundColor: ColorTokens.brown,
          iconTheme: const IconThemeData.fallback().copyWith(color: ColorTokens.brandAccent),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: CoreDimensions.paddingL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      Illustrations.profilePicture,
                      width: context.screenWidth / 2,
                    ),
                    const SizedBox(height: CoreDimensions.spacingS),
                    CoreText.body('${getIt<FirebaseAuth>().currentUser?.email}', fontWeight: FontWeight.bold),
                  ],
                ),
                CoreButton(
                  isScreenWidth: true,
                  onTap: () async {
                    await getIt<FirebaseAuth>().signOut();
                    await context.router.push(const AuthGateRoute());
                  },
                  child: CoreText.body(settingsPageLogoutButtonText.tr()),
                ),
              ],
            ),
          ),
        ),
      );
}
