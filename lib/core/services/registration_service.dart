import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase_io.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegistrationService {
  FirebaseCrashlytics get crashlytics => FirebaseCrashlytics.instance;

  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  FirebaseClient get firebaseClient => FirebaseClient.anonymous();
}
