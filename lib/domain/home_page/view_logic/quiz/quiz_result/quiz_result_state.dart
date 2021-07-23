part of 'quiz_result_bloc.dart';

@immutable
abstract class QuizResultState {
  int total;
  int right;
}

class QuizResultInitial extends QuizResultState {
  int total = 0;
  int right = 0;

  QuizResultInitial({this.total, this.right});
}

class FinalQuizResult extends QuizResultState {
  int total;
  int right;

  FinalQuizResult({this.total, this.right});
}

