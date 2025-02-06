import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haski/common/load_type.dart';
import 'package:haski/dialog/dialog_service.dart';
import 'package:haski/managers/messages/messages_manager.dart';
import 'package:haski/managers/news/news_manager.dart';
import 'package:haski/models/messages/message.dart';
import 'package:haski/models/news/news.dart';
import 'package:haski/widgets/pages/pages/news/bloc/news_page_event.dart';
import 'package:haski/widgets/pages/pages/news/bloc/news_page_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsManager newsManager;
  final MessagesManager messagesManager;
  final DialogService dialogService;

  List<News> _allNews = [];
  List<Message> _allMessages = [];
  int _currentTabIndex = 0;

  NewsBloc(
      {required this.newsManager,
      required this.dialogService,
      required this.messagesManager})
      : super(NewsInitial()) {
    on<LoadContent>(_onLoadContent);
    on<ChangeTab>(_onChangeTab);
  }

  Future<void> _onLoadContent(
      LoadContent event, Emitter<NewsState> emit) async {
    if (event.loadType == LoadType.initial) {
      emit(ContentLoading());
    }

    try {
      if (_currentTabIndex == 1) {
        _allNews = await newsManager.loadNews();
        emit(ContentLoaded());
        emit(NewsLoaded(_allNews));
        return;
      }

      _allMessages = await messagesManager.loadMessages();
      emit(ContentLoaded());
      emit(MessagesLoaded(_allMessages));
    } catch (error) {
      emit(NewsError(error.toString()));
      dialogService.showToast(error.toString());
    }
  }

  void _onChangeTab(ChangeTab event, Emitter<NewsState> emit) {
    _currentTabIndex = event.tabIndex;
    var isNeedToLoadMessage = _currentTabIndex == 0 && _allMessages.isEmpty;
    var isNeedToLoadNews = _currentTabIndex == 1 && _allNews.isEmpty;
    if (isNeedToLoadMessage || isNeedToLoadNews) {
      add(const LoadContent());
      return;
    }

    emit(ContentLoaded());
    if (_currentTabIndex == 0) {
      emit(MessagesLoaded(_allMessages));
      return;
    }

    emit(NewsLoaded(_allNews));
  }
}
