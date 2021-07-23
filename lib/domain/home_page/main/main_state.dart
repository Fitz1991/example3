part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainData extends MainState {
  Main main;

  MainData({this.main});
}

class ErrorMain extends MainState {
  String message;
  ErrorMain({this.message});
}

class LoadingMain extends MainState {}

