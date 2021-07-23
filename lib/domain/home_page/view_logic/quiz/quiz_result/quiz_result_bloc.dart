import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quiz_result_event.dart';
part 'quiz_result_state.dart';

class QuizResultBloc extends Bloc<QuizResultEvent, QuizResultState> {
  QuizResultBloc(this.total) : super(QuizResultInitial(total: total, right: 0));

  int total;

  @override
  Stream<QuizResultState> mapEventToState(
    QuizResultEvent event,
  ) async* {
    if(event is IncrementRight){
        yield* _incrementRight(event);
    }
  }

  Stream<QuizResultState> _incrementRight(IncrementRight event) async* {
    int currentRight =  state.right;
    int incrementedRight = currentRight + 1;
    yield FinalQuizResult(total: state.total, right: incrementedRight);
  }
}
