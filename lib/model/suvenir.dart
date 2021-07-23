import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serialazers.dart';

part 'suvenir.g.dart';

abstract class Suvenir implements Built<Suvenir, SuvenirBuilder> {
  @nullable
  String get id;
  String get urlImg;

  Suvenir._();
  factory Suvenir([void Function(SuvenirBuilder) updates]) = _$Suvenir;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Suvenir.serializer, this);
  }

  static Suvenir fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Suvenir.serializer, json);
  }

  static Serializer<Suvenir> get serializer => _$suvenirSerializer;
}