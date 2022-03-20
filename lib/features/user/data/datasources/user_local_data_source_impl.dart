import 'package:firebase_auth/firebase_auth.dart';
import 'package:looping_diary/features/user/data/datasources/user_local_data_source.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  const UserLocalDataSourceImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  String? getUserId() => _firebaseAuth.currentUser?.uid;
}
