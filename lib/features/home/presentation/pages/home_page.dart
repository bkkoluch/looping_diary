import 'package:flutter/material.dart';
import 'package:looping_diary/core/style/color_tokens.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorTokens.brandSecondaryVeryLight,
        appBar: AppBar(
          backgroundColor: ColorTokens.brandPrimary,
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(CoreDimensions.defaultAppBarBorderRadius),
              bottomEnd: Radius.circular(CoreDimensions.defaultAppBarBorderRadius),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Test'),
              ),
            ],
          ),
        ),
      );
}
