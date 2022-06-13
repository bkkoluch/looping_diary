import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/features/common/presentation/widgets/device_size_box.dart';

class FlutterFireUiImageStackPage extends StatelessWidget {
  const FlutterFireUiImageStackPage({
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
            child: DeviceSizeBox(
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
