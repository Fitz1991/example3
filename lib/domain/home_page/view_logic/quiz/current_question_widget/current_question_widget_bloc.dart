import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'current_question_widget_event.dart';

part 'current_question_widget_state.dart';

class CurrentQuestionWidgetBloc extends Bloc<CurrentQuestionWidgetEvent, CurrentQuestionWidgetState> {
  CurrentQuestionWidgetBloc({this.list, this.iterator}) : super(CurrentQuestionWidgetInitial(index: 0)){
    _moveNext();
  }

  Iterator iterator;
  List<String> list;

  @override
  Stream<CurrentQuestionWidgetState> mapEventToState(
    CurrentQuestionWidgetEvent event,
  ) async* {
    if (event is NextQuestion) {
      yield* _nextQuestion();
    }
    if (event is Restart) {
      yield* _restart();
    }
  }

  Stream<CurrentQuestionWidgetState> _nextQuestion() async* {
    if (_moveNext()) {
      int currentStackIndex = _getCurrentIndex();
      yield CurrentQuestionWidget(index: currentStackIndex);
    }
  }

  int _getCurrentIndex() {
    return list.indexOf(iterator.current);
  }

  bool _moveNext() {
    return iterator.moveNext();
  }

  Stream<CurrentQuestionWidgetState> _restart() async* {
    iterator = list.iterator;
    _moveNext();
    yield CurrentQuestionWidgetInitial(index: 0);
  }
}
