part of 'quiz_view_bloc.dart';

@immutable
abstract class QuizViewEvent {}

class SelectViewVariant extends QuizViewEvent{
  String variant;
  SelectViewVariant({this.variant});
}

class ResetViewVariant extends QuizViewEvent{}



