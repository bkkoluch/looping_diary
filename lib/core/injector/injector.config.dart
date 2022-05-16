// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:firebase/firebase_io.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:looping_diary/core/network/firebase_json_converter.dart' as _i8;
import 'package:looping_diary/core/network/firebase_rest_client.dart' as _i9;
import 'package:looping_diary/core/services/analytics/crash_reporting_service.dart'
    as _i18;
import 'package:looping_diary/core/services/navigation/navigation_service.dart'
    as _i3;
import 'package:looping_diary/core/services/registration_service.dart' as _i26;
import 'package:looping_diary/features/notes/data/datasources/notes_local_data_source.dart'
    as _i19;
import 'package:looping_diary/features/notes/data/datasources/notes_local_data_source_impl.dart'
    as _i20;
import 'package:looping_diary/features/notes/data/datasources/notes_remote_data_source.dart'
    as _i11;
import 'package:looping_diary/features/notes/data/datasources/notes_remote_data_source_impl.dart'
    as _i12;
import 'package:looping_diary/features/notes/data/repositories/notes_repository_impl.dart'
    as _i22;
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart'
    as _i21;
import 'package:looping_diary/features/notes/domain/use_cases/get_all_notes_use_case.dart'
    as _i24;
import 'package:looping_diary/features/notes/domain/use_cases/get_note_use_case.dart'
    as _i25;
import 'package:looping_diary/features/notes/domain/use_cases/save_note_use_case.dart'
    as _i23;
import 'package:looping_diary/features/notes/presentation/cubits/note_cubit.dart'
    as _i10;
import 'package:looping_diary/features/user/data/datasources/user_local_data_source.dart'
    as _i14;
import 'package:looping_diary/features/user/data/datasources/user_local_data_source_impl.dart'
    as _i15;
import 'package:looping_diary/features/user/data/repositories/user_repository_impl.dart'
    as _i17;
import 'package:looping_diary/features/user/domain/repositories/user_repository.dart'
    as _i16;
import 'package:shared_preferences/shared_preferences.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registrationService = _$RegistrationService();
  gh.factory<_i3.$AppRouter>(() => _i3.$AppRouter());
  gh.factory<_i4.FirebaseAuth>(() => registrationService.auth);
  gh.factory<_i5.FirebaseClient>(() => registrationService.firebaseClient);
  gh.factory<_i6.FirebaseCrashlytics>(() => registrationService.crashlytics);
  gh.factory<_i7.FirebaseFirestore>(() => registrationService.firestore);
  gh.factory<_i8.FirebaseJsonConverter>(() => _i8.FirebaseJsonConverter());
  gh.factoryAsync<_i9.FirebaseRestClient>(
      () => _i9.FirebaseRestClient.create());
  gh.lazySingleton<_i10.NoteCubit>(() => _i10.NoteCubit());
  gh.factoryAsync<_i11.NotesRemoteDataSource>(() async =>
      _i12.NotesRemoteDataSourceImpl(
          await get.getAsync<_i9.FirebaseRestClient>()));
  gh.factoryAsync<_i13.SharedPreferences>(() => registrationService.prefs);
  gh.factory<_i14.UserLocalDataSource>(
      () => _i15.UserLocalDataSourceImpl(get<_i4.FirebaseAuth>()));
  gh.factory<_i16.UserRepository>(
      () => _i17.UserRepositoryImpl(get<_i14.UserLocalDataSource>()));
  gh.factory<_i18.CrashReportingService>(
      () => _i18.CrashReportingService(get<_i6.FirebaseCrashlytics>()));
  gh.factoryAsync<_i19.NotesLocalDataSource>(() async =>
      _i20.NotesLocalDataSourceImpl(
          await get.getAsync<_i13.SharedPreferences>()));
  gh.factoryAsync<_i21.NotesRepository>(() async => _i22.NotesRepositoryImpl(
      await get.getAsync<_i19.NotesLocalDataSource>(),
      await get.getAsync<_i11.NotesRemoteDataSource>()));
  gh.factoryAsync<_i23.SaveNoteUseCase>(() async =>
      _i23.SaveNoteUseCase(await get.getAsync<_i21.NotesRepository>()));
  gh.factoryAsync<_i24.GetAllNotesUseCase>(() async =>
      _i24.GetAllNotesUseCase(await get.getAsync<_i21.NotesRepository>()));
  gh.factoryAsync<_i25.GetNoteUseCase>(() async =>
      _i25.GetNoteUseCase(await get.getAsync<_i21.NotesRepository>()));
  return get;
}

class _$RegistrationService extends _i26.RegistrationService {}
