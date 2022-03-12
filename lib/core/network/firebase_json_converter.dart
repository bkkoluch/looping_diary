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

/// Used to convert Json objects to Firebase in order to allow using REST endpoints
///
/// Example correct data:
/// { 'name' : 'some string', 'fields': { ... } }
/// For 'fields' refer to [_parseFirebaseFieldsJson]
@injectable
class FirebaseJsonConverter {
  Map<String, dynamic> convertToFirebaseJson(String name, Map<String, dynamic> fieldsJson) => {
        nameString: name,
        fieldsString: _parseFirebaseFieldsJson(fieldsJson),
      };

  /// Converts regular Json object to a Firebase valid one
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
      final FirebaseJsonValue? jsonValueType = _getFirebaseJsonValueType(value);

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
    final FirebaseJsonValue? jsonValueType = _getFirebaseJsonValueType(value);
    if (jsonValueType != null) {
      return {jsonValueType.name: value};
    } else {
      return null;
    }
  }

  FirebaseJsonValue? _getFirebaseJsonValueType(dynamic value) => FirebaseJsonValue.values.firstWhereOrNull(
        (element) {
          if (value is List) {
            return element == FirebaseJsonValue.arrayValue;
          } else if (value.runtimeType.toLowercaseString.contains(mapString)) {
            return element == FirebaseJsonValue.mapValue;
          } else {
            return element.name.contains(value.runtimeType.toLowercaseString);
          }
        },
      );
}
