import 'package:haski/models/news/news.dart';

abstract class NewsManager {
  Future<List<News>> loadNews();
}
