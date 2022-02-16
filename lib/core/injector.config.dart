// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:looping_diary/core/services/analytics/crash_reporting_service.dart'
    as _i4;
import 'package:looping_diary/core/services/registration_service.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registrationService = _$RegistrationService();
  gh.factory<_i3.FirebaseCrashlytics>(() => registrationService.crashlytics);
  gh.factory<_i4.CrashReportingService>(
      () => _i4.CrashReportingService(get<_i3.FirebaseCrashlytics>()));
  return get;
}

class _$RegistrationService extends _i5.RegistrationService {}
