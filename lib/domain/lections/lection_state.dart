part of 'lection_bloc.dart';

@immutable
abstract class LectionState {}

class LectionInitial extends LectionState {}

class LectionData extends LectionState {
  BuiltList<AssemblyMasterClasses> lections;

  LectionData({this.lections});
}

class ErrorLection extends LectionState {
  String message;
  ErrorLection({this.message});
}

class LoadingLection extends LectionState {}