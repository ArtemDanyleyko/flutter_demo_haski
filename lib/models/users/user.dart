import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
      {required this.id,
      required this.photo,
      required this.name,
      required this.profession});

  final int id;
  final String photo;
  final String name;
  final String profession;

  @override
  List<Object?> get props => [id, photo, name, profession];
}
