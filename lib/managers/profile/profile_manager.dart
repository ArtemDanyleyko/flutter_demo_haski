import 'package:haski/models/users/user.dart';

abstract class ProfileManager {
  Future<User> getCurrentUser();
}
