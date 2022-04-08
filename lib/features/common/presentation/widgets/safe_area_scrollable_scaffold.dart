import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/style/color_tokens.dart';

class SafeAreaScrollableScaffold extends StatelessWidget {
  const SafeAreaScrollableScaffold({
    required this.child,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorTokens.brandSecondaryVeryLight,
        body: SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: context.screenHeight,
              maxWidth: context.screenHeight,
            ),
            child: SingleChildScrollView(child: child),
          ),
        ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      );
}
