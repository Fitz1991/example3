part of 'suvenirs_bloc.dart';

@immutable
abstract class SuvenirsState {}

class SuvenirsInitial extends SuvenirsState {}

class SuvenirsData extends SuvenirsState {
  BuiltList<Suvenir> suvenirs;

  SuvenirsData({this.suvenirs});
}

class ErrorSuvenirs extends SuvenirsState {
  String message;
  ErrorSuvenirs({this.message});
}

class LoadingSuvenirs extends SuvenirsState {}