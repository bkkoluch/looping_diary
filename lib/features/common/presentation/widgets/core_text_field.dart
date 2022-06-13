import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/design_tokens/text_tokens.dart';

class CoreTextField extends StatelessWidget {
  const CoreTextField({
    required this.controller,
    required this.focusNode,
    required this.autofocus,
    required this.onTap,
    this.maxLines,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool autofocus;
  final int? maxLines;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) => TextField(
        onTap: onTap,
        cursorWidth: 3,
        maxLines: maxLines,
        focusNode: focusNode,
        autofocus: autofocus,
        controller: controller,
        cursorHeight: context.screenHeight * 0.04,
        style: TextTokens.bodyLg(context: context),
        decoration: const InputDecoration(border: InputBorder.none),
        cursorRadius: const Radius.circular(CoreDimensions.coreInputFieldBorderRadius),
      );
}
