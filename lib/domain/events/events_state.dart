part of 'events_bloc.dart';

@immutable
abstract class EventsState {}

class EventsInitial extends EventsState {}

class EventsData extends EventsState {
  BuiltList<Event> events;

  EventsData({this.events});
}

class ErrorEvents extends EventsState {
  String message;
  ErrorEvents({this.message});
}

class LoadingEvents extends EventsState {}