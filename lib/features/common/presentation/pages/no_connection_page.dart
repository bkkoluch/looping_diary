import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/core/style/illustrations.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_text.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorTokens.brown,
        body: Column(
          children: [
            SizedBox(
              width: context.screenWidth * 0.7,
              height: context.screenHeight * 0.4,
              child: SvgPicture.asset(Illustrations.noConnection),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: CoreText.titleMd(
                'There\'s no connection, when you\'ll have it back, the request will be retried automatically',
              ),
            )
          ],
        ),
      );
}
