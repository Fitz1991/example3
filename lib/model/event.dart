import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'serialazers.dart';
import 'volga_slider_model.dart';

part 'event.g.dart';

abstract class Event implements Built<Event, EventBuilder> {
  @nullable
  String get id;
  String get title;
  String get intro;
  Timestamp get date;
  String get imgUrl;
  String get place;
  String get link;
  String get conditions;
  BuiltList<VolgaSliderModel> get slider;

  Event._();
  factory Event([void Function(EventBuilder) updates]) = _$Event;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Event.serializer, this);
  }

  static Event fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Event.serializer, json);
  }

  static Serializer<Event> get serializer => _$eventSerializer;
}
