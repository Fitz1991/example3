import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:republic_on_volga/data/home_page/main/repository/main_repository.dart';
import 'package:republic_on_volga/domain/utils/crash_reporter.dart';
import 'package:republic_on_volga/domain/utils/timeout_handler.dart';
import 'package:republic_on_volga/model/home_page/main/main.dart';

import '../../../main.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({this.mainRepository}) : super(MainInitial());
  MainRepository mainRepository;

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
      if(event is GetMain) yield* _getMain();
      if(event is SuccessMainEvent) yield MainData(main: event.main);
      if(event is ErrorMainEvent) yield ErrorMain(message: event.message);
      if(event is LoadingMainEvent) yield LoadingMain();
  }

  Stream<MainState> _getMain() async*{
    add(LoadingMainEvent());
    final mainData = (mainRepository.main() as Stream<Main>);
    handleTimeout(mainData, (err) => add(ErrorMainEvent(message: err)));
    mainData.listen((main){
      add(SuccessMainEvent(main: main));
    }).onError((err, stackTrace){
      log.e(err);
      reportError(exception: err, stack: stackTrace);
      add(ErrorMainEvent(message: err.message));
    });
  }
}
