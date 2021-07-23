import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:republic_on_volga/data/lessons/repository/lection_repository.dart';
import 'package:republic_on_volga/domain/utils/crash_reporter.dart';
import 'package:republic_on_volga/domain/utils/timeout_handler.dart';
import 'package:republic_on_volga/main.dart';
import 'package:republic_on_volga/model/assembly_master_classes.dart';

part 'lection_event.dart';
part 'lection_state.dart';

class LectionBloc extends Bloc<LectionEvent, LectionState> {
  LectionBloc({this.lectionRepository}) : super(LectionInitial());

  LectionRepository lectionRepository;

  @override
  Stream<LectionState> mapEventToState(
    LectionEvent event,
  ) async* {
    if (event is GetLectionEvent) yield* _getLection();
    if (event is SuccessLectionEvent)
      yield LectionData(lections: event.lections);
    if (event is ErrorLectionEvent) yield ErrorLection(message: event.message);
    if (event is LoadingLectionEvent) yield LoadingLection();
  }

  Stream<LectionState> _getLection() async* {
    add(LoadingLectionEvent());
    try {
      var lections = (lectionRepository.lections() as Stream<List<AssemblyMasterClasses>>);
      handleTimeout(lections, (err) => add(ErrorLectionEvent(message: err)));
      lections.listen((lection) {
        add(SuccessLectionEvent(lections: BuiltList.from(lection)));
      }).onError((err, stackTrace) {
        log.e(err, err, stackTrace);
        reportError(exception: err, stack: stackTrace);
        add(ErrorLectionEvent(message: err.toString()));
      });
    } catch (e, stacktrace) {
      log.e(e, e, stacktrace);
    }
  }
}
