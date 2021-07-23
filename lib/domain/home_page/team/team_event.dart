part of 'team_bloc.dart';

@immutable
abstract class TeamEvent {}

class GetTeamEvent extends TeamEvent{}
class LoadingTeamEvent extends TeamEvent{}
class SuccessTeamEvent extends TeamEvent{
  BuiltList<Member> members;

  SuccessTeamEvent({this.members});
}
class ErrorTeamEvent extends TeamEvent{
  String message;

  ErrorTeamEvent({this.message});
}