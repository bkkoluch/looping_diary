import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:looping_diary/features/user/data/datasources/user_local_data_source.dart';
import 'package:looping_diary/utils/shared_prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: UserLocalDataSource)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  const UserLocalDataSourceImpl(this._firebaseAuth, this._sharedPreferences);

  final FirebaseAuth _firebaseAuth;
  final SharedPreferences _sharedPreferences;

  @override
  String? getUserId() => _firebaseAuth.currentUser?.uid ?? const Uuid().v4();

  @override
  Future<void> saveUserId(String userId) async => await _sharedPreferences.setString(SharedPrefsKeys.userId(), userId);
}
