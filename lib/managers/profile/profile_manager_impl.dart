import 'package:haski/managers/profile/profile_manager.dart';
import 'package:haski/models/users/user.dart';

class ProfileManagerImpl extends ProfileManager {
  @override
  Future<User> getCurrentUser() {
    return Future.value(const User(
        id: 1,
        photo: "https://surl.li/bpohaa",
        name: "Короленко С. И.",
        profession: "Водитель"));
  }
}
