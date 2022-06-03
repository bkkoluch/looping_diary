import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/network/firebase_json_converter.dart';
import 'package:looping_diary/features/user/domain/repositories/user_repository.dart';

const String _baseUrl = 'https://firestore.googleapis.com/v1/projects/looping-diary/databases/(default)/documents/';
const String _notFoundField = 'NOT_FOUND';
const String updateMaskFieldPathsString = 'updateMask.fieldPaths';

@injectable
class FirebaseRestClient {
  const FirebaseRestClient();

  @factoryMethod
  static Future<FirebaseRestClient> create() async => const FirebaseRestClient();

  Future<String?> get _userId async => (await getIt.getAsync<UserRepository>()).getUserId();

  Future patchWithQueryParameters(String uri, Map<String, dynamic> json, Map<String, dynamic> queryParameters) async =>
      http.patch(
        Uri.parse('$_baseUrl${await _userId}$uri').replace(queryParameters: queryParameters),
        body: jsonEncode(json),
      );

  Future<Map<String, dynamic>?> get(String uri) async {
    final http.Response result = await http.get(Uri.parse('$_baseUrl${await _userId}$uri'));

    final decodedJson = json.decode(result.body);

    if (decodedJson.entries.first.value is! String && decodedJson.entries.first.value['status'] == _notFoundField) {
      return null;
    }

    final Map<String, dynamic> firebaseJson = decodedJson['fields'];

    final Map<String, dynamic> resultAfterConversion =
        getIt<FirebaseJsonConverter>().convertFirebaseJsonToUnderstandableOne(firebaseJson) ?? {};

    return resultAfterConversion;
  }
}
