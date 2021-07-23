import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:republic_on_volga/domain/home_page/view_logic/quiz/current_question_widget/current_question_widget_bloc.dart';
import 'package:republic_on_volga/domain/home_page/view_logic/quiz/quiz_result/quiz_result_bloc.dart';
import 'package:republic_on_volga/domain/home_page/view_logic/quiz/quiz_view_all/quiz_view/quiz_view_bloc.dart';
import 'package:republic_on_volga/domain/home_page/view_logic/quiz/quiz_view_all/quiz_view_all_bloc.dart';
import 'package:republic_on_volga/model/quiz.dart';

class QuizWidget extends StatelessWidget {
  Quiz quiz;
  QuizResultBloc quizResultBloc;
  List<String> answers;
  QuizViewAllBloc quizViewAllBloc;

  QuizWidget({this.quiz, this.quizResultBloc}){
    answers = [quiz.rightAnswer, ...quiz.wrongAnswers];
    answers.shuffle();
    quizViewAllBloc = QuizViewAllBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(imageUrl: quiz.imageUrl),
        SizedBox(
          height: 16,
        ),
        Text(
          quiz.question,
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 24,
        ),
        ...answers
            .map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: AnswerButton(
          text: e,
          quiz: quiz,
          quizResultBloc: quizResultBloc,
          quizViewAllBloc: quizViewAllBloc,
        ),
            ))
            .toList(),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

class AnswerButton extends StatelessWidget {
  String text;
  Quiz quiz;
  QuizResultBloc quizResultBloc;
  QuizViewAllBloc quizViewAllBloc;
  QuizViewBloc quizViewBloc;

  AnswerButton({this.text, this.quiz, this.quizResultBloc, this.quizViewAllBloc});

  @override
  Widget build(BuildContext context) {
    quizViewBloc = QuizViewBloc(
        quiz: quiz,
        quizResultBloc: quizResultBloc,
        quizViewAllBloc: quizViewAllBloc,
        currentQuestionWidgetBloc: BlocProvider.of<CurrentQuestionWidgetBloc>(context));
    return BlocBuilder<QuizViewBloc, QuizViewState>(builder: (_, state) {
      return GestureDetector(
          onTap: () {
            quizViewBloc.add(SelectViewVariant(variant: text));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: state.backColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Text(text, style: TextStyle(color: state.textColor),),
          ));
    }, cubit: quizViewBloc,);
  }
}

class ResultQuizWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizResultBloc, QuizResultState>(
        builder: (context, state) => Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Результат', style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 24),),
                SizedBox(height: 16,),
                Text('${state.right.toString()} из ${state.total.toString()}', style: Theme.of(context).textTheme
                    .bodyText1.copyWith(fontSize: 20)
                  ,),
              ],
            )));
  }
}
