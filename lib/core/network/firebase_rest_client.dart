import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/config/environment_config.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/network/firebase_json_converter.dart';
import 'package:looping_diary/features/user/domain/repositories/user_repository.dart';
import 'package:looping_diary/secrets/keys.dart';

final String _baseUrl =
    'https://firestore.googleapis.com/v1/projects/${Keys.getProjectId(EnvironmentConfig.getEnumFromString!)}/databases/(default)/documents/';
const String _notFoundField = 'NOT_FOUND';
const String _statusField = 'status';
const String _fieldsField = 'fields';
const String updateMaskFieldPathsString = 'updateMask.fieldPaths';

@injectable
class FirebaseRestClient {
  const FirebaseRestClient(this.dio);

  final Dio dio;

  @factoryMethod
  static FirebaseRestClient create(Dio dio) => FirebaseRestClient(dio);

  String? get _userId => getIt.get<UserRepository>().getUserId();

  Future patchWithQueryParameters(String uri, Map<String, dynamic> json, Map<String, dynamic> queryParameters) async =>
      await dio.patch('$_baseUrl$_userId$uri', data: jsonEncode(json), queryParameters: queryParameters);

  Future<Map<String, dynamic>?> get(String uri) async {
    final Response result = await dio.get('$_baseUrl$_userId$uri');

    final decodedJson = result.data;

    if (decodedJson.entries.length == 0 ||
        decodedJson.entries.first.value is! String && decodedJson.entries.first.value[_statusField] == _notFoundField) {
      return null;
    }

    final Map<String, dynamic> firebaseJson = decodedJson[_fieldsField];

    final Map<String, dynamic> resultAfterConversion =
        getIt<FirebaseJsonConverter>().convertFirebaseJsonToUnderstandableOne(firebaseJson) ?? {};

    return resultAfterConversion;
  }
}
