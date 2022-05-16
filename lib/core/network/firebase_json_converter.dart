import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:looping_diary/core/extensions/dynamic_extensions.dart';

const String mapString = 'map';
const String nameString = 'name';
const String fieldsString = 'fields';
const String valuesString = 'values';

enum FirebaseJsonValue {
  arrayValue,
  booleanValue,
  bytesValue,
  doubleValue,
  integerValue,
  geoPointValue,
  mapValue,
  nullValue,
  referenceValue,
  stringValue,
  timestampValue,
}

@injectable
class FirebaseJsonConverter {
  /// Used to convert JSON objects to FirebaseJson in order to allow using Firebase REST endpoints
  ///
  /// Example correct data:
  /// { 'name' : 'some string', 'fields': { ... } }
  /// For 'fields' refer to [_parseFirebaseFieldsJson]
  Map<String, dynamic> convertToFirebaseJson(String name, Map<String, dynamic> fieldsJson) => {
        nameString: name,
        fieldsString: _parseFirebaseFieldsJson(fieldsJson),
      };

  /// Used to convert FirebaseJson objects to JSON
  ///
  /// Example correct data:
  /// input: {'date': {stringValue: '22.22.2222'}, 'entry': {stringValue: 'Some cool text'}}
  /// output: {'date' : '22.22.2222', 'entry' : 'Some cool text'}
  Map<String, dynamic> convertFirebaseJsonToUnderstandableOne(Map<String, dynamic> firebaseJson) {
    final Map<String, dynamic> regularJson = {};

    firebaseJson.forEach((key, value) {
      final FirebaseJsonValue? jsonValueType = _getFirebaseJsonValueTypeFromBasicType(key);

      final bool isValueOfValidType = jsonValueType != null;

      if (isValueOfValidType) {
        for (final entry in value.entries) {
          if (entry.key == FirebaseJsonValue.mapValue.name) {
            regularJson[key] = convertFirebaseJsonToUnderstandableOne(entry.value['fields']);
          } else if (_isFirebaseJsonType(entry.key)) {
            regularJson[key] =
                _getBasicTypeFromFirebaseJsonValueType(_getFirebaseJsonTypeFromFirebaseString(entry.key)!, entry.value);
          } else {
            regularJson[key] = entry.value;
          }
        }
      }
    });

    return regularJson;
  }

  /// Converts regular JSON object to a Firebase valid one
  ///
  /// Examples:
  /// input:  {'date' : '22.22.2222', 'entry' : 'Some cool text'}
  /// output: {'date': {stringValue: '22.22.2222'}, 'entry': {stringValue: 'Some cool text'}}
  ///
  /// input:  {'someArray': [1,2,3]}
  /// output: {'someArray' : {arrayValue: {values: [{integerValue: 1}, {integerValue: 2}, {integerValue: 3}]}} }
  ///
  /// input:  {'someMap' : {'someObjectKey' : 'someValue'}}
  /// output: {'someMap' : {mapValue: {'someObjectKey': {stringValue: 'someValue'}}}}
  Map<String, Object> _parseFirebaseFieldsJson(Map<String, dynamic> json) {
    final Map<String, Object> firebaseJson = {};

    json.forEach((key, value) {
      final FirebaseJsonValue? jsonValueType = _getFirebaseJsonValueTypeFromBasicType(value);

      final bool isValueOfValidType = jsonValueType != null;

      if (isValueOfValidType) {
        // List type conversion
        if (value is List) {
          final List valuesArray = [];
          for (final element in value) {
            valuesArray.add(_convertToFirebaseValue(element));
          }
          firebaseJson[key] = {
            jsonValueType.name: {valuesString: valuesArray}
          };

          // Map type conversion
        } else if (value is Map<String, dynamic>) {
          firebaseJson[key] = {
            jsonValueType.name: {fieldsString: _parseFirebaseFieldsJson(value)}
          };
        }

        // Other basic types conversion
        else {
          firebaseJson[key] = _convertToFirebaseValue(value)!;
        }

        // Conversion of not basic types, any custom classes, example: NoteDateDto
      } else if (_isNotOfBasicType(value.runtimeType)) {
        if (value.toJson() is Map) {
          firebaseJson[key] = {
            FirebaseJsonValue.mapValue.name: {
              fieldsString: _parseFirebaseFieldsJson(value.toJson()),
            }
          };
        }
      }
    });

    return firebaseJson;
  }

  /// Converts regular value to Firebase valid one
  ///
  /// Examples:
  /// 1 --- {"integerValue" : 1}
  /// "string" --- {"stringValue" : "string"}
  Map<String, dynamic>? _convertToFirebaseValue(dynamic value) {
    final FirebaseJsonValue? jsonValueType = _getFirebaseJsonValueTypeFromBasicType(value);
    if (jsonValueType != null) {
      return {jsonValueType.name: value};
    } else {
      return null;
    }
  }

  FirebaseJsonValue? _getFirebaseJsonValueTypeFromBasicType(dynamic value) => FirebaseJsonValue.values.firstWhereOrNull(
        (element) {
          if (value is List) {
            return element == FirebaseJsonValue.arrayValue;
          } else if (value.runtimeType.toLowerCaseString.contains(mapString)) {
            return element == FirebaseJsonValue.mapValue;
          } else {
            return element.name.contains(value.runtimeType.toLowerCaseString);
          }
        },
      );

  Object? _getBasicTypeFromFirebaseJsonValueType(FirebaseJsonValue firebaseType, dynamic value) {
    if (firebaseType == FirebaseJsonValue.integerValue) {
      return int.tryParse(value);
    } else if (firebaseType == FirebaseJsonValue.doubleValue) {
      return double.tryParse(value);
    } else if (firebaseType == FirebaseJsonValue.arrayValue) {
      return value as List;
    } else if (firebaseType == FirebaseJsonValue.mapValue) {
      return value as Map;
    } else if (firebaseType == FirebaseJsonValue.stringValue) {
      return value as String;
    } else if (firebaseType == FirebaseJsonValue.booleanValue) {
      return value as bool;
    }
    return value;
  }

  bool _isFirebaseJsonType(String value) => FirebaseJsonValue.values.any((element) => element.name == value);

  FirebaseJsonValue? _getFirebaseJsonTypeFromFirebaseString(String firebaseTypeString) =>
      FirebaseJsonValue.values.firstWhere(
        (value) => value.toLowerCaseString.contains(firebaseTypeString.toLowerCaseString),
      );

  bool _isNotOfBasicType(Type? type) =>
      type != String &&
      type is! int &&
      type is! double &&
      type is! Map &&
      type is! List &&
      type is! bool &&
      type != null;
}
