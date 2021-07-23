import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:republic_on_volga/data/resources.dart';
import 'package:republic_on_volga/domain/home_page/view_logic/quiz/current_question_widget/current_question_widget_bloc.dart';
import 'package:republic_on_volga/domain/home_page/view_logic/quiz/quiz_result/quiz_result_bloc.dart';
import 'package:republic_on_volga/domain/screen/screen_cubit.dart';
import 'package:republic_on_volga/model/quiz.dart';
import 'package:republic_on_volga/model/quiz_screen_arguments.dart';
import 'package:republic_on_volga/model/selected_item_menu.dart';
import 'package:republic_on_volga/view/home_page/tests/quiz_widget.dart';
import 'package:republic_on_volga/view/single_page_widget.dart';

import '../../main_app_bar.dart';

class QuizView extends StatefulWidget {
  QuizView();

  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  QuizScreenArgument quizScreenArgument;
  Iterator iterator;
  List<Widget> quizStack;

  BuiltList<Quiz> quiz;

  List<QuizWidget> quizViewList;
  QuizResultBloc quizResultBloc;

  List<String> quizItems;

  @override
  void didChangeDependencies() {
    quizScreenArgument = ModalRoute.of(context).settings.arguments;
    quiz = quizScreenArgument.test.quiz;
    quizResultBloc = QuizResultBloc(quiz.length);
    quizItems = List.generate(quiz.length + 1, (index) => '$index');
    iterator = quizItems.iterator;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    quizResultBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CurrentQuestionWidgetBloc>(
            create: (BuildContext context) =>
                CurrentQuestionWidgetBloc(iterator: iterator, list: quizItems),
          ),
        ],
        child: SinglePageWidget(
            appBar: MainAppBar(
              title: quizScreenArgument.test.title,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined, color: HexColor(primaryColor), size: 20,),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: BlocBuilder<ScreenCubit, ScreenState>(
              builder: (context, state) {
                if (state is ScreenHeight) {
                  return Container(
                      padding: EdgeInsets.all(8),
                      height: state.height - bottomMenuIndent - homeAppBarHeight,
                      child:ListView(
                        children: [
                          BlocBuilder<CurrentQuestionWidgetBloc, CurrentQuestionWidgetState>(
                            builder: (context, state) {
                              if(state.index != quizItems.indexOf(quizItems.last)){
                                return QuizWidget(
                                  quiz: quiz[state.index],
                                  quizResultBloc: quizResultBloc,
                                );
                              }else{
                                return BlocProvider(
                                  create: (context) => quizResultBloc,
                                  child: ResultQuizWidget(),
                                );
                              }
                            },
                          ),
                          BlocBuilder<CurrentQuestionWidgetBloc, CurrentQuestionWidgetState>(
                            builder: (context, state) {
                              if (state.index == quizItems.indexOf(quizItems.last)) {
                                return
                                  InkWell(
                                    onTap: () {
                                      quizResultBloc = QuizResultBloc(quiz.length);
                                      BlocProvider.of<CurrentQuestionWidgetBloc>(context).add(Restart());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: HexColor(primaryColor).withOpacity(0.55))
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                                      child: Center(child: Text('Пройти еще раз', style: Theme.of(context).textTheme
                                          .bodyText1,
                                      ),),
                                    ),
                                  );
                              } else {
                                return
                                  InkWell(
                                    onTap: () {
                                      BlocProvider.of<CurrentQuestionWidgetBloc>(context).add(NextQuestion());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: HexColor(primaryColor).withOpacity(0.55))
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                                      child: Center(child: Text('Далее', style: Theme.of(context).textTheme.bodyText1,),),
                                    ),
                                  );
                              }
                            },
                          )
                        ],
                      )
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
            selectedItemMenu: SelectedItemMenu(home: true)));
  }
}
