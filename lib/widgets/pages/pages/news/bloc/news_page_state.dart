import 'package:equatable/equatable.dart';
import 'package:haski/models/messages/message.dart';
import 'package:haski/models/news/news.dart';
import 'package:haski/models/shifts/shift_group.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object?> get props => [];
}

class ContentLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoaded extends NewsState {
  final List<News> news;
  const NewsLoaded(this.news);

  @override
  List<Object?> get props => [news];
}

class MessagesLoaded extends NewsState {
  final List<Message> messages;
  const MessagesLoaded(this.messages);

  @override
  List<Object?> get props => [messages];
}

class NewsError extends NewsState {
  final Object? exeption;
  const NewsError(this.exeption);

  @override
  List<Object?> get props => [exeption];
}

class TabChanged extends NewsState {
  final List<ShiftGroup> shifts;
  const TabChanged({required this.shifts});

  @override
  List<Object?> get props => [shifts];
}
