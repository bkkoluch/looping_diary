import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/style/color_tokens.dart';

class DeviceSizeBox extends StatelessWidget {
  const DeviceSizeBox({required this.child, this.color = ColorTokens.brown, Key? key}) : super(key: key);

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: color,
        child: SizedBox(
          height: context.screenHeight,
          width: context.screenWidth,
          child: child,
        ),
      );
}
