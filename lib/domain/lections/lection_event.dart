part of 'lection_bloc.dart';

@immutable
abstract class LectionEvent {}

class GetLectionEvent extends LectionEvent{}
class LoadingLectionEvent extends LectionEvent{}
class SuccessLectionEvent extends LectionEvent{
  BuiltList<AssemblyMasterClasses> lections;

  SuccessLectionEvent({this.lections});
}
class ErrorLectionEvent extends LectionEvent{
  String message;

  ErrorLectionEvent({this.message});
}