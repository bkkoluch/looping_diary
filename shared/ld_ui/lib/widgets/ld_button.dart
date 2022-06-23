import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ld_ui/core/extensions/context_extensions.dart';
import 'package:ld_ui/core/style/core_dimensions.dart';
import 'package:ld_ui/core/style/design_tokens/color_tokens.dart';

class LDButton extends StatefulWidget {
  const LDButton({
    required this.onTap,
    required this.child,
    this.isSmall = false,
    this.isScreenWidth = false,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final Widget child;
  final bool isSmall;
  final bool isScreenWidth;

  @override
  State<LDButton> createState() => _LDButtonState();
}

class _LDButtonState extends State<LDButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) => InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CoreDimensions.coreButtonBorderRadius),
        ),
        onTapDown: (_) => _changeButtonState(true),
        onTapCancel: () => _changeButtonState(false),
        onTap: _onTap,
        child: GlassFilter(
          isSmall: widget.isSmall,
          isClicked: isClicked,
          isScreenWidth: widget.isScreenWidth,
          child: widget.child,
        ),
      );

  void _onTap() {
    widget.onTap();
    _changeButtonState(false);
  }

  void _changeButtonState(bool isDown) => setState(() => isClicked = isDown);
}

class GlassFilter extends StatelessWidget {
  const GlassFilter({
    required this.child,
    required this.isSmall,
    required this.isClicked,
    required this.isScreenWidth,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final bool isSmall;
  final bool isClicked;
  final bool isScreenWidth;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(CoreDimensions.coreButtonBorderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: isScreenWidth ? context.screenWidth : _buttonWidth,
                height: CoreDimensions.coreButtonHeight,
                decoration: _getBoxDecoration(),
                child: Center(child: child),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: isScreenWidth ? context.screenWidth : _buttonWidth,
                height: isClicked ? 0 : 3,
                margin: EdgeInsets.only(top: _buttonHeight),
                decoration: _getBoxDecoration(
                  boxShadow: const [
                    BoxShadow(color: ColorTokens.baseShadow, spreadRadius: 1, blurRadius: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  BoxDecoration _getBoxDecoration({List<BoxShadow>? boxShadow}) => BoxDecoration(
        color: (boxShadow != null ? ColorTokens.black : ColorTokens.white).withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(CoreDimensions.coreButtonBorderRadius)),
        border: Border.all(width: 1.5, color: ColorTokens.white.withOpacity(0.2)),
        boxShadow: boxShadow,
      );

  double get _buttonWidth => isSmall ? CoreDimensions.coreSmallButtonWidth : CoreDimensions.coreButtonWidth;

  double get _buttonHeight => CoreDimensions.coreButtonHeight;
}
