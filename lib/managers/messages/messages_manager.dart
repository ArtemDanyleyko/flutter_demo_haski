import 'package:haski/models/messages/message.dart';

abstract class MessagesManager {
  Future<List<Message>> loadMessages();
}
