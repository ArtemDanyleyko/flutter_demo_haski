import 'authorization_manager.dart';

class AuthorizationManagerImpl extends AuthorizationManager {
  @override
  Future<bool> authorize(
      String username, String password, bool shouldSaveUser) {
    return Future.value(true);
  }

  @override
  Future<bool> logout() {
    return Future.value(true);
  }
}
