import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:republic_on_volga/model/quiz.dart';
import 'serialazers.dart';

part 'volga_test.g.dart';


abstract class VolgaTest implements Built<VolgaTest, VolgaTestBuilder> {
  @nullable
  String get id;
  String get title;
  String get imageUrl;
  BuiltList<Quiz> get quiz;

  VolgaTest._();
  factory VolgaTest([void Function(VolgaTestBuilder) updates]) = _$VolgaTest;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(VolgaTest.serializer, this);
  }

  static VolgaTest fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(VolgaTest.serializer, json);
  }

  static Serializer<VolgaTest> get serializer => _$volgaTestSerializer;
}