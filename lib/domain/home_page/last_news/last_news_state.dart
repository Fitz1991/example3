part of 'last_news_bloc.dart';

@immutable
abstract class LastNewsState {}

class LastNewsInitial extends LastNewsState {}

class LastNewsData extends LastNewsState {
  BuiltList<News> lastNews;

  LastNewsData({this.lastNews});
}

class ErrorLastNews extends LastNewsState {
  String message;
  ErrorLastNews({this.message});
}

class LoadingLastNews extends LastNewsState {}