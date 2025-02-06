import 'dart:async';
import 'dart:math';
import 'package:haski/managers/news/news_manager.dart';
import 'package:haski/models/news/news.dart';

class NewsManagerImpl extends NewsManager {
  final Random _random = Random();

  @override
  Future<List<News>> loadNews() {
    final newsList1 = [
      News(
        id: 1,
        title: 'Новости: Мир в центре внимания',
        subscription: 'Главные новости дня и события со всего мира.',
        image:
            'https://img.freepik.com/free-vector/news-grunge-text_460848-9369.jpg',
      ),
      News(
        id: 2,
        title: 'Технологические обновления',
        subscription:
            'Новые прорывы в IT-индустрии и стартапы, меняющие рынок.',
        image:
            'https://img.freepik.com/free-vector/news-grunge-text_460848-9369.jpg',
      ),
      News(
        id: 3,
        title: 'Экономика и финансы',
        subscription:
            'Анализ мировых рынков и советы экспертов по инвестициям.',
        image:
            'https://img.freepik.com/free-vector/news-grunge-text_460848-9369.jpg',
      ),
      News(
        id: 4,
        title: 'Культура и искусство',
        subscription:
            'Анонсы выставок, концертов и культурных событий в городе.',
        image:
            'https://img.freepik.com/free-vector/news-grunge-text_460848-9369.jpg',
      ),
    ];

    final newsList2 = [
      News(
        id: 5,
        title: 'Спортивные итоги',
        subscription: 'Результаты соревнований и интервью со звёздами спорта.',
        image:
            'https://img.freepik.com/free-vector/news-grunge-text_460848-9369.jpg',
      ),
      News(
        id: 6,
        title: 'Погодные новости',
        subscription:
            'Прогноз погоды на неделю и необычные метеорологические явления.',
        image:
            'https://img.freepik.com/free-vector/news-grunge-text_460848-9369.jpg',
      ),
      News(
        id: 7,
        title: 'Политическая арена',
        subscription:
            'Обзор актуальных событий в политике и интервью с аналитиками.',
        image:
            'https://img.freepik.com/free-vector/news-grunge-text_460848-9369.jpg',
      ),
      News(
        id: 8,
        title: 'Здоровье и образ жизни',
        subscription:
            'Советы экспертов по здоровью, фитнесу и правильному питанию.',
        image:
            'https://img.freepik.com/free-vector/news-grunge-text_460848-9369.jpg',
      ),
    ];

    final allNews = [newsList1, newsList2];
    int randomIndex = _random.nextInt(allNews.length);

    return Future.delayed(
      Duration(seconds: 2),
      () => allNews[randomIndex],
    );
  }
}
