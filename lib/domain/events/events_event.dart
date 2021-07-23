part of 'events_bloc.dart';

@immutable
abstract class EventsEvent {}

class GetEventsEvent extends EventsEvent{}
class LoadingEventsEvent extends EventsEvent{}
class SuccessEventsEvent extends EventsEvent{
  BuiltList<Event> events;

  SuccessEventsEvent({this.events});
}
class ErrorEventsEvent extends EventsEvent{
  String message;

  ErrorEventsEvent({this.message});
}