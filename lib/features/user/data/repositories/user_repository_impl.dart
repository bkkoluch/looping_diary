import 'package:injectable/injectable.dart';
import 'package:looping_diary/features/user/data/data_sources/user_local_data_source.dart';
import 'package:looping_diary/features/user/domain/repositories/user_repository.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._userLocalDataSource);

  final UserLocalDataSource _userLocalDataSource;

  /// Gets current user id
  ///
  /// Remember to never use it when user might not be logged in as it'll result in an error
  @override
  String? getUserId() => _userLocalDataSource.getUserId();
}
