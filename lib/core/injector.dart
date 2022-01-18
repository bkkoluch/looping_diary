import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
)
void configureInjector() => $initGetIt(getIt);
