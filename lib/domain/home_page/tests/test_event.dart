part of 'test_bloc.dart';

@immutable
abstract class TestEvent {}

class GetTestEvent extends TestEvent{}
class LoadingTestEvent extends TestEvent{}

class SuccessTestEvent extends TestEvent{
  BuiltList<VolgaTest> tests;

  SuccessTestEvent({this.tests});
}

class ErrorTestEvent extends TestEvent{
  String message;

  ErrorTestEvent({this.message});
}