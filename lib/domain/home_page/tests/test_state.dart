part of 'test_bloc.dart';

@immutable
abstract class TestState {}

class TestInitial extends TestState {}

class TestData extends TestState {
  BuiltList<VolgaTest> tests;

  TestData({this.tests});
}

class ErrorTest extends TestState {
  String message;
  ErrorTest({this.message});
}

class LoadingTest extends TestState {}