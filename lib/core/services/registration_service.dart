import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';

@module
abstract class RegistrationService {
  FirebaseCrashlytics get crashlytics => FirebaseCrashlytics.instance;
  AppRouter get router => AppRouter();
}
