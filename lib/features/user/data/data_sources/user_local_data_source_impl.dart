import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:looping_diary/features/user/data/data_sources/user_local_data_source.dart';

@Injectable(as: UserLocalDataSource)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  const UserLocalDataSourceImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  String? getUserId() => _firebaseAuth.currentUser?.uid;
}
