import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serialazers.dart';
part 'member.g.dart';

abstract class Member implements Built<Member, MemberBuilder> {
  @nullable
  String get id;
  String get socialUrl;
  String get socialUrlPath;
  String get imgUrl;
  String get surname;
  String get name;
  String get secondName;
  String get position;
  String get description;

  Member._();
  factory Member([void Function(MemberBuilder) updates]) = _$Member;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Member.serializer, this);
  }

  static Member fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Member.serializer, json);
  }

  static Serializer<Member> get serializer => _$memberSerializer;
}


