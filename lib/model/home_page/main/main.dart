import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:republic_on_volga/model/serialazers.dart';
import 'package:republic_on_volga/model/volga_slider_model.dart';

part 'main.g.dart';

abstract class Main implements Built<Main, MainBuilder> {
  @nullable
  String get id;

  String get about;

  BuiltList<VolgaSliderModel> get slider;

  BuiltList<VolgaSliderModel> get sliderWithDesc;

  String get slogan;

  Main._();

  factory Main([void Function(MainBuilder) updates]) = _$Main;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Main.serializer, this);
  }

  static Main fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Main.serializer, json);
  }

  static Serializer<Main> get serializer => _$mainSerializer;
}
