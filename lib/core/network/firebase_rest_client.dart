import 'package:firebase/firebase_io.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirebaseRestClient extends FirebaseClient {
  FirebaseRestClient(this.userCredential) : super(userCredential);

  final String? userCredential;

  @factoryMethod
  static Future<FirebaseRestClient> create() async => FirebaseRestClient(await _credential);

  @preResolve
  static Future<String?> get _credential async => await FirebaseAuth.instance.currentUser?.getIdToken(true);
}
