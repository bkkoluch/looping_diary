import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase_io.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';

@module
abstract class RegistrationService {
  FirebaseCrashlytics get crashlytics => FirebaseCrashlytics.instance;

  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  AppRouter get router => AppRouter();

  FirebaseClient get firebaseClient => FirebaseClient.anonymous();
}
