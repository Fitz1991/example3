import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:republic_on_volga/model/master_class.dart';

import 'serialazers.dart';
part 'assembly_master_classes.g.dart';

abstract class AssemblyMasterClasses implements Built<AssemblyMasterClasses, AssemblyMasterClassesBuilder> {
  @nullable
  String get id;
  String get title;
  String get url;
  BuiltList<MasterClass> get lessons;

  AssemblyMasterClasses._();
  factory AssemblyMasterClasses([void Function(AssemblyMasterClassesBuilder) updates]) = _$AssemblyMasterClasses;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AssemblyMasterClasses.serializer, this);
  }

  static AssemblyMasterClasses fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AssemblyMasterClasses.serializer, json);
  }

  static Serializer<AssemblyMasterClasses> get serializer => _$assemblyMasterClassesSerializer;
}