import 'package:flutter/material.dart';
import 'package:looping_diary/core/style/design_tokens/text_tokens.dart';

class CoreTextField extends StatelessWidget {
  const CoreTextField({
    required this.focusNode,
    required this.controller,
    this.maxLines,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController controller;
  final int? maxLines;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) => TextField(
        autofocus: true,
        focusNode: focusNode,
        controller: controller,
        maxLines: maxLines,
        onChanged: onChanged,
        style: TextTokens.bodyLg(context: context),
        decoration: const InputDecoration(border: InputBorder.none),
      );
}
