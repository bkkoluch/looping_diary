import 'package:flutter/material.dart';
import 'package:ld_ui/core/extensions/context_extensions.dart';
import 'package:ld_ui/core/style/design_tokens/color_tokens.dart';

class LDDeviceSizeBox extends StatelessWidget {
  const LDDeviceSizeBox({required this.child, this.color = ColorTokens.brown, Key? key}) : super(key: key);

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
