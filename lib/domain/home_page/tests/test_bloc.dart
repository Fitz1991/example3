import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:republic_on_volga/data/home_page/main/repository/test_repository.dart';
import 'package:republic_on_volga/domain/utils/crash_reporter.dart';
import 'package:republic_on_volga/domain/utils/timeout_handler.dart';
import 'package:republic_on_volga/main.dart';
import 'package:republic_on_volga/model/volga_test.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc({this.testRepository}) : super(TestInitial());

  TestRepository testRepository;

  @override
  Stream<TestState> mapEventToState(
    TestEvent event,
  ) async* {
    if (event is GetTestEvent) yield* _getTest();
    if (event is SuccessTestEvent)
      yield TestData(tests: event.tests);
    if (event is ErrorTestEvent) yield ErrorTest(message: event.message);
    if (event is LoadingTestEvent) yield LoadingTest();
  }

  Stream<TestState> _getTest() async* {
    add(LoadingTestEvent());
    try {
      var tests = (testRepository.tests() as Stream<List<VolgaTest>>);
      handleTimeout(tests, (err) => add(ErrorTestEvent(message: err)));
      tests.listen((Test) {
        add(SuccessTestEvent(tests: BuiltList.from(Test)));
      }).onError((err, stackTrace) {
        log.e(err, err, stackTrace);
        reportError(exception: err, stack: stackTrace);
        add(ErrorTestEvent(message: err.toString()));
      });
    } catch (e, stacktrace) {
      log.e(e, e, stacktrace);
    }
  }
}
