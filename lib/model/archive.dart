import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serialazers.dart';

part 'archive.g.dart';

abstract class Archive implements Built<Archive, ArchiveBuilder> {
  @nullable
  String get id;
  String get description;
  String get imgUrl;
  String get title;
  String get url;

  Archive._();

  factory Archive([void Function(ArchiveBuilder) updates]) = _$Archive;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Archive.serializer, this);
  }

  static Archive fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Archive.serializer, json);
  }

  static Serializer<Archive> get serializer => _$archiveSerializer;
}
