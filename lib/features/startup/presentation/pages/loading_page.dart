import 'package:flutter/material.dart';
import 'package:ld_ui/ld_ui.dart';
import 'package:looping_diary/core/style/lotties.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LDDeviceSizeBox(
        child: Center(
          child: Lottie.asset(
            Lotties.bookFlipping,
            animate: true,
            repeat: true,
          ),
        ),
      );
}
