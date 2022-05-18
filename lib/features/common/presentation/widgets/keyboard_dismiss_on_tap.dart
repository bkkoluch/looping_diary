import 'package:flutter/material.dart';

/// KeyboardDismissOnTap widget
///
/// Use it whenever you need to close a keyboard/change focus on tap
/// Ex.: wrapping a Scaffold's body will result in closing the keyboard
/// When tapping outside the TextField
class KeyboardDismissOnTapWidget extends StatelessWidget {
  const KeyboardDismissOnTapWidget({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: FocusScope.of(context).unfocus,
        child: child,
      );
}
