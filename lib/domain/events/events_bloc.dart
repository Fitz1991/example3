import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:republic_on_volga/data/event_page/repository/event_repository.dart';
import 'package:republic_on_volga/domain/utils/crash_reporter.dart';
import 'package:republic_on_volga/domain/utils/timeout_handler.dart';
import 'package:republic_on_volga/main.dart';
import 'package:republic_on_volga/model/event.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc({this.eventRepository}) : super(EventsInitial());

  EventRepository eventRepository;

  @override
  Stream<EventsState> mapEventToState(
    EventsEvent event,
  ) async* {
    if (event is GetEventsEvent) yield* _getEvents();
    if (event is SuccessEventsEvent)
      yield EventsData(events: event.events);
    if (event is ErrorEventsEvent) yield ErrorEvents(message: event.message);
    if (event is LoadingEventsEvent) yield LoadingEvents();
  }

  Stream<EventsState> _getEvents() async* {
    add(LoadingEventsEvent());
    try {
      var events = (eventRepository.events() as Stream<List<Event>>);
      handleTimeout(events, (err) => add(ErrorEventsEvent(message: err)));
      events.listen((events) {
        add(SuccessEventsEvent(events: BuiltList.from(events)));
      }).onError((err, stackTrace) {
        log.e(err, err, stackTrace);
        reportError(exception: err, stack: stackTrace);
        add(ErrorEventsEvent(message: err.toString()));
      });
    } catch (e, stacktrace) {
      log.e(e, e, stacktrace);
    }
  }
}
