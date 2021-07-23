part of 'last_news_bloc.dart';

@immutable
abstract class LastNewsEvent {}
class GetLastNews extends LastNewsEvent{}
class LoadingLastNewsEvent extends LastNewsEvent{}
class SuccessLastNewsEvent extends LastNewsEvent{
  BuiltList<News> lastNews;

  SuccessLastNewsEvent({this.lastNews});
}
class ErrorLastNewsEvent extends LastNewsEvent{
  String message;

  ErrorLastNewsEvent({this.message});
}