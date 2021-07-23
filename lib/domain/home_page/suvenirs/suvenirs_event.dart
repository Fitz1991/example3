part of 'suvenirs_bloc.dart';

@immutable
abstract class SuvenirsEvent {}

class GetSuvenirsEvent extends SuvenirsEvent{}
class LoadingSuvenirsEvent extends SuvenirsEvent{}
class SuccessSuvenirsEvent extends SuvenirsEvent{
  BuiltList<Suvenir> suvenirs;

  SuccessSuvenirsEvent({this.suvenirs});
}
class ErrorSuvenirsEvent extends SuvenirsEvent{
  String message;

  ErrorSuvenirsEvent({this.message});
}