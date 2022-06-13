import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';

class CoreButton extends StatefulWidget {
  const CoreButton({
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
  State<CoreButton> createState() => _CoreButtonState();
}

class _CoreButtonState extends State<CoreButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) => InkWell(
        onTapDown: (_) => _changeButtonState(true),
        onTapCancel: () => _changeButtonState(false),
        onTap: _onTap,
        child: GlassFilter(
          child: widget.child,
          isSmall: widget.isSmall,
          isClicked: isClicked,
          isScreenWidth: widget.isScreenWidth,
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
              Container(
                width: isScreenWidth ? context.screenWidth : _buttonWidth,
                height: CoreDimensions.coreButtonHeight,
                decoration: _getBoxDecoration(),
                child: Center(child: child),
              ),
              Container(
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
