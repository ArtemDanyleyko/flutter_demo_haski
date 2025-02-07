abstract class AuthorizationManager {
  Future<bool> authorize(String username, String password, bool shouldSaveUser);
  Future<bool> logout();
}
