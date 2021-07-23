import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quiz_view_all_event.dart';
part 'quiz_view_all_state.dart';

class QuizViewAllBloc extends Bloc<QuizViewAllEvent, QuizViewAllState> {
  QuizViewAllBloc() : super(QuizViewAllInitial());

  @override
  Stream<QuizViewAllState> mapEventToState(
    QuizViewAllEvent event,
  ) async* {
    if(event is BlockQuiz) yield QuizViewAllSelected();
    if(event is UnblockQuiz) yield QuizViewAllInitial();
  }
}
