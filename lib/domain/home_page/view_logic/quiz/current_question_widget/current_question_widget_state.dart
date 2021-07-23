part of 'current_question_widget_bloc.dart';

@immutable
abstract class CurrentQuestionWidgetState {
  int index = 0;
}

class CurrentQuestionWidgetInitial extends CurrentQuestionWidgetState {
  int index = 0;
  CurrentQuestionWidgetInitial({this.index});
}

class CurrentQuestionWidget extends CurrentQuestionWidgetState {
  int index;
  CurrentQuestionWidget({this.index});
}
