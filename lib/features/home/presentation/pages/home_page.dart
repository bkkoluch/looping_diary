import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/datetime_extensions.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/color_tokens.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/illustrations.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: get note's date
    final DateTime now = DateTime.now();
    return Scaffold(
      backgroundColor: ColorTokens.brandSecondaryVeryLight,
      appBar: AppBar(
        backgroundColor: ColorTokens.brandPrimary,
        title: Center(child: Text(now.toReadableFormat)),
        elevation: CoreDimensions.defaultAppBarElevation,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(CoreDimensions.defaultAppBarBorderRadius),
            bottomEnd: Radius.circular(CoreDimensions.defaultAppBarBorderRadius),
          ),
        ),
      ),
      // TODO: display notes on current day
      body: const SizedBox.shrink(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorTokens.brandPrimary,
        onPressed: () {
          context.router.push(const AddNoteRoute());
        },
        child: SizedBox(
          width: CoreDimensions.defaultIconSize,
          height: CoreDimensions.defaultIconSize,
          child: Image.asset(Illustrations.newNote),
        ),
      ),
    );
  }
}
