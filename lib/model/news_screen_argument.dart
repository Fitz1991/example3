import 'package:republic_on_volga/domain/home_page/last_news/last_news_bloc.dart';

import 'home_page/main/news.dart';

class NewsScreenArgument {
  News news;
  LastNewsBloc bloc;

  NewsScreenArgument({this.news, this.bloc});
}
