import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:republic_on_volga/model/serialazers.dart';
import 'package:republic_on_volga/model/volga_slider_model.dart';

part 'news.g.dart';

abstract class News implements Built<News, NewsBuilder> {
  @nullable
  String get id;

  String get title;

  String get description;

  Timestamp get date;

  BuiltList<VolgaSliderModel> get slider;

  News._();

  factory News([void Function(NewsBuilder) updates]) = _$News;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(News.serializer, this);
  }

  static News fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(News.serializer, json);
  }

  static Serializer<News> get serializer => _$newsSerializer;
}
