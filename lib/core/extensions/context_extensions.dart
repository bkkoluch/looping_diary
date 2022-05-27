import 'package:flutter/widgets.dart';

extension BuildContextExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get keyboardOffset => MediaQuery.of(this).viewInsets.bottom;

  bool get isKeyboardVisible => keyboardOffset > 0;
}
