import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:looping_diary/core/style/color_tokens.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: ColorTokens.main,
        body: SpinKitPouringHourGlass(
          color: ColorTokens.white,
          size: CoreDimensions.mainLoadingIndicatorSize,
          duration: Duration(milliseconds: 1500),
        ),
      );
}
