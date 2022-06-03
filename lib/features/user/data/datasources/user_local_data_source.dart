abstract class UserLocalDataSource {
  String? getUserId();

  Future<void> saveUserId(String userId);
}
