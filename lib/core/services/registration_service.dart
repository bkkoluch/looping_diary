import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegistrationService {
  Dio get dio => Dio();

  FirebaseCrashlytics get crashlytics => FirebaseCrashlytics.instance;

  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  FirebaseAuth get auth => FirebaseAuth.instance;

  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  AppRouter get appRouter => AppRouter();
}
