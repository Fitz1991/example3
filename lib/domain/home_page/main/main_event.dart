part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class GetMain extends MainEvent{}
class LoadingMainEvent extends MainEvent{}
class SuccessMainEvent extends MainEvent{
  Main main;

  SuccessMainEvent({this.main});
}
class ErrorMainEvent extends MainEvent{
  String message;

  ErrorMainEvent({this.message});
}
