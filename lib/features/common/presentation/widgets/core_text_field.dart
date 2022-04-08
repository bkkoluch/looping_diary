import 'package:flutter/material.dart';

class CoreTextField extends StatelessWidget {
  const CoreTextField({
    required this.focusNode,
    required this.controller,
    this.maxLines = 1,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController controller;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) => TextField(
        focusNode: focusNode,
        controller: controller,
        maxLines: maxLines,
        onChanged: onChanged,
      );
}
