import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ld_ui/core/extensions/context_extensions.dart';
import 'package:ld_ui/core/style/core_dimensions.dart';
import 'package:ld_ui/core/style/design_tokens/color_tokens.dart';
import 'package:ld_ui/widgets/ld_device_size_box.dart';

class LDFlutterFireUiImageStackPage extends StatelessWidget {
  const LDFlutterFireUiImageStackPage({
    required this.illustrationPath,
    required this.child,
    Key? key,
  }) : super(key: key);

  final String illustrationPath;
  final Widget child;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Center(
            child: LDDeviceSizeBox(
              child: Column(
                children: [
                  const SizedBox(height: CoreDimensions.paddingXXL),
                  SvgPicture.asset(
                    illustrationPath,
                    width: context.screenWidth / 2.2,
                    height: context.screenWidth / 2.8,
                  ),
                ],
              ),
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(scaffoldBackgroundColor: ColorTokens.transparent),
            child: child,
          ),
        ],
      );
}
