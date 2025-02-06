import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/common/load_type.dart';
import 'package:haski/dialog/dialog_service.dart';
import 'package:haski/managers/messages/messages_manager.dart';
import 'package:haski/managers/news/news_manager.dart';
import 'package:haski/widgets/pages/pages/news/bloc/news_page_bloc.dart';
import 'package:haski/widgets/pages/pages/news/bloc/news_page_event.dart';
import 'package:haski/widgets/pages/pages/news/bloc/news_page_state.dart';
import 'package:haski/widgets/pages/pages/news/items/news_app_bar.dart';
import 'package:injector/injector.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with SingleTickerProviderStateMixin {
  late final NewsManager newsManager;
  late final DialogService dialogService;
  late final MessagesManager messagesManager;
  late final NewsBloc _screenCubit;
  late TabController _tabController;
  Completer<void>? _refreshCompleter;

  @override
  void initState() {
    super.initState();
    final injector = Injector.appInstance;
    newsManager = injector.get<NewsManager>();
    dialogService = injector.get<DialogService>();
    messagesManager = injector.get<MessagesManager>();

    _screenCubit = NewsBloc(
      newsManager: newsManager,
      messagesManager: messagesManager,
      dialogService: dialogService,
    )..add(const LoadContent(loadType: LoadType.initial));

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      _screenCubit.add(ChangeTab(_tabController.index));
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    _screenCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewsBloc, NewsState>(
      bloc: _screenCubit,
      listener: (context, state) {
        if (state is MessagesLoaded ||
            state is NewsLoaded ||
            state is NewsError ||
            state is ContentLoaded) {
          _refreshCompleter?.complete();
          _refreshCompleter = null;
        }
      },
      child: Scaffold(
        appBar: NewsAppBar(
          tabController: _tabController,
          onTabChange: (index) {},
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildMessagesTab(),
            _buildNewsTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsTab() {
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: _screenCubit,
      builder: (context, state) {
        if (state is ContentLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              _refreshCompleter = Completer<void>();
              _screenCubit.add(const LoadContent(loadType: LoadType.refresh));
              return _refreshCompleter!.future;
            },
            child: ListView.separated(
              itemCount: state.news.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final news = state.news[index];
                return Container(
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(news.image, fit: BoxFit.fitWidth),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Text(news.title),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 16.0, right: 16.0, bottom: 16.0),
                        child: Text(news.subscription),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state is NewsError) {
          return Center(child: Text('Ошибка: ${state.exeption.toString()}'));
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildMessagesTab() {
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: _screenCubit,
      builder: (context, state) {
        if (state is ContentLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MessagesLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              _refreshCompleter = Completer<void>();
              _screenCubit.add(const LoadContent(loadType: LoadType.refresh));
              await _refreshCompleter!.future;
              return;
            },
            child: ListView.builder(
              itemCount: state.messages.length,
              itemBuilder: (context, index) {
                final message = state.messages[index];
                return Container(
                    clipBehavior: Clip.antiAlias,
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Text(message.text),
                    ));
              },
            ),
          );
        } else if (state is NewsError) {
          return Center(child: Text('Ошибка: ${state.exeption.toString()}'));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
