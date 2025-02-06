import 'package:equatable/equatable.dart';

class News extends Equatable {
  const News(
      {required this.id,
      required this.title,
      required this.subscription,
      required this.image});

  final int id;
  final String title;
  final String subscription;
  final String image;

  @override
  List<Object> get props {
    return [id, title, subscription, image];
  }
}
