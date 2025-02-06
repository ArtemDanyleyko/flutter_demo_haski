import 'package:equatable/equatable.dart';

class Message extends Equatable {
  const Message({required this.id, required this.text});

  final int id;
  final String text;

  @override
  List<Object> get props {
    return [id, text];
  }
}
