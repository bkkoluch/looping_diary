import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';

class DeviceSizeBox extends StatelessWidget {
  const DeviceSizeBox({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: child,
      );
}
