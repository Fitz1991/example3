import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:meta/meta.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/domain/home_page/view_logic/quiz/current_question_widget/current_question_widget_bloc.dart';
import 'package:republic_on_volga/domain/home_page/view_logic/quiz/quiz_result/quiz_result_bloc.dart';
import 'package:republic_on_volga/model/quiz.dart';

import '../quiz_view_all_bloc.dart';

part 'quiz_view_event.dart';
part 'quiz_view_state.dart';

class QuizViewBloc extends Bloc<QuizViewEvent, QuizViewState> {
  QuizViewBloc({this.quiz, this.quizResultBloc, this.quizViewAllBloc, this.currentQuestionWidgetBloc}) : super
      (QuizViewInitial()){
    currentQuestionWidgetBloc.listen((state) {
        if(state is CurrentQuestionWidgetInitial){
          add(ResetViewVariant());
          quizViewAllBloc.add(UnblockQuiz());
        }
    });
  }

  QuizViewAllBloc quizViewAllBloc;
  QuizResultBloc quizResultBloc;
  CurrentQuestionWidgetBloc currentQuestionWidgetBloc;
  Quiz quiz;

  @override
  Stream<QuizViewState> mapEventToState(
    QuizViewEvent event,
  ) async* {
    if(event is SelectViewVariant){
      yield* _selectViewVariant(event);
    }
    if(event is ResetViewVariant){
      yield* _resetViewVariant();
    }
  }

  Stream<QuizViewState> _selectViewVariant(SelectViewVariant event) async*{
    if(quizViewAllBloc.state is! QuizViewAllSelected){
      if(state is! QuizViewRight && state is! QuizViewWrong){
        if(event.variant == quiz.rightAnswer) {
          quizResultBloc.add(IncrementRight());
          quizViewAllBloc.add(BlockQuiz());
          yield QuizViewRight();
        } else{
          quizViewAllBloc.add(BlockQuiz());
          yield QuizViewWrong();
        }
      }
    }
  }

  Stream<QuizViewState> _resetViewVariant() async* {
    yield QuizViewInitial();
  }

  @override
  Future<void> close() {
    quizResultBloc.close();
    quizViewAllBloc.close();
    currentQuestionWidgetBloc.close();
    return super.close();
  }
}
