// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i9;
import 'package:dio/dio.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:looping_diary/core/cubits/app_cubit.dart' as _i4;
import 'package:looping_diary/core/network/firebase_json_converter.dart' as _i10;
import 'package:looping_diary/core/network/firebase_rest_client.dart' as _i11;
import 'package:looping_diary/core/services/analytics/crash_reporting_service.dart' as _i21;
import 'package:looping_diary/core/services/navigation/navigation_service.dart' as _i3;
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart' as _i5;
import 'package:looping_diary/core/services/registration_service.dart' as _i35;
import 'package:looping_diary/features/notes/data/data_sources/notes_local_data_source.dart' as _i22;
import 'package:looping_diary/features/notes/data/data_sources/notes_local_data_source_impl.dart' as _i23;
import 'package:looping_diary/features/notes/data/data_sources/notes_remote_data_source.dart' as _i13;
import 'package:looping_diary/features/notes/data/data_sources/notes_remote_data_source_impl.dart' as _i14;
import 'package:looping_diary/features/notes/data/repositories/notes_repository_impl.dart' as _i25;
import 'package:looping_diary/features/notes/domain/repositories/notes_repository.dart' as _i24;
import 'package:looping_diary/features/notes/domain/use_cases/delete_note_use_case.dart' as _i31;
import 'package:looping_diary/features/notes/domain/use_cases/get_all_notes_use_case.dart' as _i32;
import 'package:looping_diary/features/notes/domain/use_cases/save_note_use_case.dart' as _i30;
import 'package:looping_diary/features/notes/presentation/cubits/note_cubit.dart' as _i12;
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_local_data_source.dart' as _i26;
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_local_data_source_impl.dart' as _i27;
import 'package:looping_diary/features/onboarding/data/repositories/onboarding_repository.dart' as _i28;
import 'package:looping_diary/features/onboarding/domain/repositories/onboarding_repository_impl.dart' as _i29;
import 'package:looping_diary/features/onboarding/domain/use_cases/get_onboarding_seen_use_case.dart' as _i33;
import 'package:looping_diary/features/onboarding/domain/use_cases/mark_onboarding_as_seen_use_case.dart' as _i34;
import 'package:looping_diary/features/onboarding/presentation/cubits/onboarding_cubit.dart' as _i15;
import 'package:looping_diary/features/user/data/data_sources/user_local_data_source.dart' as _i17;
import 'package:looping_diary/features/user/data/data_sources/user_local_data_source_impl.dart' as _i18;
import 'package:looping_diary/features/user/data/repositories/user_repository_impl.dart' as _i20;
import 'package:looping_diary/features/user/domain/repositories/user_repository.dart' as _i19;
import 'package:shared_preferences/shared_preferences.dart' as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get, {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registrationService = _$RegistrationService();
  gh.factory<_i3.$AppRouter>(() => _i3.$AppRouter());
  gh.lazySingleton<_i4.AppCubit>(() => _i4.AppCubit());
  gh.factory<_i5.AppRouter>(() => registrationService.appRouter);
  gh.factory<_i6.Dio>(() => registrationService.dio);
  gh.factory<_i7.FirebaseAuth>(() => registrationService.auth);
  gh.factory<_i8.FirebaseCrashlytics>(() => registrationService.crashlytics);
  gh.factory<_i9.FirebaseFirestore>(() => registrationService.firestore);
  gh.factory<_i10.FirebaseJsonConverter>(() => _i10.FirebaseJsonConverter());
  gh.factory<_i11.FirebaseRestClient>(() => _i11.FirebaseRestClient.create(get<_i6.Dio>()));
  gh.lazySingleton<_i12.NoteCubit>(() => _i12.NoteCubit());
  gh.factory<_i13.NotesRemoteDataSource>(() => _i14.NotesRemoteDataSourceImpl(get<_i11.FirebaseRestClient>()));
  gh.factory<_i15.OnboardingCubit>(() => _i15.OnboardingCubit());
  gh.factoryAsync<_i16.SharedPreferences>(() => registrationService.prefs);
  gh.factory<_i17.UserLocalDataSource>(() => _i18.UserLocalDataSourceImpl(get<_i7.FirebaseAuth>()));
  gh.factory<_i19.UserRepository>(() => _i20.UserRepositoryImpl(get<_i17.UserLocalDataSource>()));
  gh.factory<_i21.CrashReportingService>(() => _i21.CrashReportingService(get<_i8.FirebaseCrashlytics>()));
  gh.factoryAsync<_i22.NotesLocalDataSource>(
      () async => _i23.NotesLocalDataSourceImpl(await get.getAsync<_i16.SharedPreferences>()));
  gh.factoryAsync<_i24.NotesRepository>(() async =>
      _i25.NotesRepositoryImpl(await get.getAsync<_i22.NotesLocalDataSource>(), get<_i13.NotesRemoteDataSource>()));
  gh.factoryAsync<_i26.OnboardingLocalDataSource>(
      () async => _i27.OnboardingLocalDataSourceImpl(await get.getAsync<_i16.SharedPreferences>()));
  gh.factoryAsync<_i28.OnboardingRepository>(
      () async => _i29.OnboardingRepositoryImpl(await get.getAsync<_i26.OnboardingLocalDataSource>()));
  gh.factoryAsync<_i30.SaveNoteUseCase>(() async => _i30.SaveNoteUseCase(await get.getAsync<_i24.NotesRepository>()));
  gh.factoryAsync<_i31.DeleteNoteUseCase>(
      () async => _i31.DeleteNoteUseCase(await get.getAsync<_i24.NotesRepository>()));
  gh.factoryAsync<_i32.GetAllNotesUseCase>(
      () async => _i32.GetAllNotesUseCase(await get.getAsync<_i24.NotesRepository>()));
  gh.factoryAsync<_i33.GetOnboardingSeenUseCase>(
      () async => _i33.GetOnboardingSeenUseCase(await get.getAsync<_i28.OnboardingRepository>()));
  gh.factoryAsync<_i34.MarkOnboardingAsSeenUseCase>(
      () async => _i34.MarkOnboardingAsSeenUseCase(await get.getAsync<_i28.OnboardingRepository>()));
  return get;
}

class _$RegistrationService extends _i35.RegistrationService {}
