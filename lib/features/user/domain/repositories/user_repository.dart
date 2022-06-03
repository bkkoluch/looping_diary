abstract class UserRepository {
  String? getUserId();

  Future<void> saveUserId(String userId);
}
