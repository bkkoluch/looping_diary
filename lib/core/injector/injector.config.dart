// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase/firebase_io.dart' as _i4;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:looping_diary/core/network/firebase_json_converter.dart' as _i7;
import 'package:looping_diary/core/network/firebase_rest_client.dart' as _i8;
import 'package:looping_diary/core/services/analytics/crash_reporting_service.dart'
    as _i9;
import 'package:looping_diary/core/services/navigation/navigation_service.dart'
    as _i3;
import 'package:looping_diary/core/services/registration_service.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registrationService = _$RegistrationService();
  gh.factory<_i3.$AppRouter>(() => _i3.$AppRouter());
  gh.factory<_i4.FirebaseClient>(() => registrationService.firebaseClient);
  gh.factory<_i5.FirebaseCrashlytics>(() => registrationService.crashlytics);
  gh.factory<_i6.FirebaseFirestore>(() => registrationService.firestore);
  gh.factory<_i7.FirebaseJsonConverter>(() => _i7.FirebaseJsonConverter());
  gh.factoryAsync<_i8.FirebaseRestClient>(
      () => _i8.FirebaseRestClient.create());
  gh.factory<_i9.CrashReportingService>(
      () => _i9.CrashReportingService(get<_i5.FirebaseCrashlytics>()));
  return get;
}

class _$RegistrationService extends _i10.RegistrationService {}
