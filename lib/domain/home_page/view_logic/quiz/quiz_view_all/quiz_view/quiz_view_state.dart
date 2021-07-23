part of 'quiz_view_bloc.dart';

@immutable
abstract class QuizViewState {
  Color backColor;
  Color textColor;
  bool isSelect;
}

class QuizViewInitial extends QuizViewState {
  Color backColor = HexColor(backgroundColor);
  bool isSelect = false;
}

class QuizViewRight extends QuizViewState {
  Color backColor = Colors.greenAccent;
  Color textColor = Colors.white;
  bool isSelect = true;
}

class QuizViewWrong extends QuizViewState {
  Color backColor = Colors.redAccent;
  Color textColor = Colors.white;
  bool isSelect = true;
}

