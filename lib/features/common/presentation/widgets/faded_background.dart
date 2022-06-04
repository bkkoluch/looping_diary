import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';

class FadedBackground extends StatelessWidget {
  const FadedBackground({
    required this.child,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final String imagePath;

  @override
  Widget build(BuildContext context) => Container(
        width: context.screenWidth,
        height: context.screenHeight,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)),
        child: Opacity(opacity: 0.8, child: child),
      );
}
