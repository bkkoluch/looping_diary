import 'dart:async';

import 'package:alchemist/alchemist.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async => AlchemistConfig.runWithConfig(
      config: const AlchemistConfig(
        // TODO: Maybe update to run depending on env
        // On CI don't run platform goldens
        // Locally do run platform goldens
        platformGoldensConfig: PlatformGoldensConfig(enabled: false),
      ),
      run: testMain,
    );
