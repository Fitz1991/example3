import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:republic_on_volga/model/serialazers.dart';
part 'volga_slider_model.g.dart';

abstract class VolgaSliderModel implements Built<VolgaSliderModel, VolgaSliderModelBuilder> {
  @nullable
  String get title;
  @nullable
  String get desc;
  String get url;

  VolgaSliderModel._();
  factory VolgaSliderModel([void Function(VolgaSliderModelBuilder) updates]) = _$VolgaSliderModel;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(VolgaSliderModel.serializer, this);
  }

  static VolgaSliderModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(VolgaSliderModel.serializer, json);
  }

  static Serializer<VolgaSliderModel> get serializer => _$volgaSliderModelSerializer;
}
