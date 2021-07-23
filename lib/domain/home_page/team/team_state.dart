part of 'team_bloc.dart';

@immutable
abstract class TeamState {}

class TeamInitial extends TeamState {}

class TeamData extends TeamState {
  BuiltList<Member> members;

  TeamData({this.members});
}

class ErrorTeam extends TeamState {
  String message;
  ErrorTeam({this.message});
}

class LoadingTeam extends TeamState {}