import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/style/design_tokens/text_tokens.dart';

class CoreTextField extends StatelessWidget {
  const CoreTextField({
    required this.controller,
    required this.focusNode,
    this.maxLines,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final int? maxLines;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) => TextField(
        focusNode: focusNode,
        autofocus: true,
        controller: controller,
        maxLines: maxLines,
        style: TextTokens.bodyLg(context: context),
        cursorWidth: 3,
        cursorHeight: context.screenHeight * 0.04,
        cursorRadius: const Radius.circular(20),
        decoration: const InputDecoration(border: InputBorder.none),
      );
}
