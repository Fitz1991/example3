import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:republic_on_volga/data/home_page/main/repository/suvenir_repository.dart';
import 'package:republic_on_volga/domain/utils/crash_reporter.dart';
import 'package:republic_on_volga/domain/utils/timeout_handler.dart';
import 'package:republic_on_volga/main.dart';
import 'package:republic_on_volga/model/suvenir.dart';

part 'suvenirs_event.dart';
part 'suvenirs_state.dart';

class SuvenirsBloc extends Bloc<SuvenirsEvent, SuvenirsState> {
  SuvenirsBloc({this.suvenirsRepository}) : super(SuvenirsInitial());

  SuvenirsRepository suvenirsRepository;

  @override
  Stream<SuvenirsState> mapEventToState(
    SuvenirsEvent event,
  ) async* {
    if (event is GetSuvenirsEvent) yield* _getSuvenirs();
    if (event is SuccessSuvenirsEvent)
      yield SuvenirsData(suvenirs: event.suvenirs);
    if (event is ErrorSuvenirsEvent) yield ErrorSuvenirs(message: event.message);
    if (event is LoadingSuvenirsEvent) yield LoadingSuvenirs();
  }

  Stream<SuvenirsState> _getSuvenirs() async* {
    add(LoadingSuvenirsEvent());
    try {
      var Suvenirss = (suvenirsRepository.suvenirs() as
      Stream<List<Suvenir>>);
      handleTimeout(Suvenirss, (err) => add(ErrorSuvenirsEvent(message: err)));
      Suvenirss.listen((Suvenirs) {
        add(SuccessSuvenirsEvent(suvenirs: BuiltList.from(Suvenirs)));
      }).onError((err, stackTrace) {
        log.e(err, err, stackTrace);
        reportError(exception: err, stack: stackTrace);
        add(ErrorSuvenirsEvent(message: err.toString()));
      });
    } catch (e, stacktrace) {
      log.e(e, e, stacktrace);
    }
  }
}
