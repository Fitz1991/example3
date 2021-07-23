part of 'current_question_widget_bloc.dart';

@immutable
abstract class CurrentQuestionWidgetEvent {}

class NextQuestion extends CurrentQuestionWidgetEvent{}

class Restart extends CurrentQuestionWidgetEvent{}
