import 'package:firebase/firebase_io.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/user/domain/repositories/user_repository.dart';

const String _baseUrl = 'https://firestore.googleapis.com/v1/projects/looping-diary/databases/(default)/documents/';

@injectable
class FirebaseRestClient extends FirebaseClient {
  FirebaseRestClient(this.userCredential) : super(userCredential);

  final String? userCredential;

  @factoryMethod
  static Future<FirebaseRestClient> create() async => FirebaseRestClient(await _credential);

  @preResolve
  static Future<String?> get _credential async => await FirebaseAuth.instance.currentUser?.getIdToken(true);

  String? get _userId => getIt<UserRepository>().getUserId();

  @override
  Future patch(uri, json) => super.patch('$_baseUrl$_userId/$uri}', json);

  @override
  Future get(uri) => super.get('$_baseUrl$_userId/$uri}');

  @override
  Future<void> delete(uri) => super.delete('$_baseUrl$_userId/$uri}');
}
