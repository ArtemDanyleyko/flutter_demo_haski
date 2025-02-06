import 'dart:async';
import 'dart:math';
import 'package:haski/managers/messages/messages_manager.dart';
import 'package:haski/models/messages/message.dart';

class MessagesManagerImpl extends MessagesManager {
  final Random _random = Random();

  @override
  Future<List<Message>> loadMessages() {
    final messagesList1 = [
      Message(
        id: 1,
        text:
            'Новости: Мир в центре внимания — сегодня мировые лидеры обсудили актуальные вопросы глобальной безопасности.',
      ),
      Message(
        id: 2,
        text:
            'Технологические обновления: Новейшие прорывы в IT-индустрии обещают изменить привычный образ жизни.',
      ),
      Message(
        id: 3,
        text:
            'Экономика и финансы: Эксперты прогнозируют рост мировых рынков в ближайшие месяцы.',
      ),
      Message(
        id: 4,
        text:
            'Культура и искусство: В городе открылась выставка современных художников.',
      ),
    ];

    final messagesList2 = [
      Message(
        id: 5,
        text:
            'Спортивные итоги: Завершились чемпионаты, и спортсмены установили новые рекорды.',
      ),
      Message(
        id: 6,
        text:
            'Погодные новости: Метеорологи прогнозируют ясную погоду на предстоящую неделю.',
      ),
      Message(
        id: 7,
        text:
            'Политическая арена: В парламенте прошли важные обсуждения по вопросам реформ.',
      ),
      Message(
        id: 8,
        text:
            'Здоровье и образ жизни: Эксперты делятся советами по поддержанию активного образа жизни и правильному питанию.',
      ),
    ];

    final allMessages = [messagesList1, messagesList2];
    int randomIndex = _random.nextInt(allMessages.length);

    return Future.delayed(
      Duration(seconds: 2),
      () => allMessages[randomIndex],
    );
  }
}
