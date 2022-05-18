import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/user/domain/repositories/user_repository.dart';

const String _baseUrl = 'https://firestore.googleapis.com/v1/projects/looping-diary/databases/(default)/documents/';

@injectable
class FirebaseRestClient {
  const FirebaseRestClient();

  @factoryMethod
  static Future<FirebaseRestClient> create() async => const FirebaseRestClient();

  String? get _userId => getIt<UserRepository>().getUserId();

  Future patch(String uri, Map<String, dynamic> json) => http.patch(Uri.parse('$_baseUrl$_userId$uri'), body: json);

  Future patchWithQueryParameters(String uri, Map<String, dynamic> json, Map<String, dynamic> queryParameters) =>
      http.patch(Uri.parse('$_baseUrl$_userId$uri').replace(queryParameters: queryParameters), body: jsonEncode(json));

  Future get(String uri) => http.get(Uri.parse('$_baseUrl$_userId$uri'));

  Future<void> delete(String uri) => http.delete(Uri.parse('$_baseUrl$_userId$uri'));
}
