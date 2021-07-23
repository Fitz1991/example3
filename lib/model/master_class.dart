import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'serialazers.dart';
part 'master_class.g.dart';

abstract class MasterClass implements Built<MasterClass, MasterClassBuilder> {
  @nullable
  String get id;

  Timestamp get date;

  String get description;

  String get url;

  String get title;

  MasterClass._();
  factory MasterClass([void Function(MasterClassBuilder) updates]) = _$MasterClass;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MasterClass.serializer, this);
  }

  static MasterClass fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(MasterClass.serializer, json);
  }

  static Serializer<MasterClass> get serializer => _$masterClassSerializer;
}
