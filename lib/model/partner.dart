import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serialazers.dart';
part 'partner.g.dart';

abstract class Partner implements Built<Partner, PartnerBuilder> {
  @nullable
  String get id;

  String get urlImg;

  String get urlPartner;

  Partner._();
  factory Partner([void Function(PartnerBuilder) updates]) = _$Partner;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Partner.serializer, this);
  }

  static Partner fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Partner.serializer, json);
  }

  static Serializer<Partner> get serializer => _$partnerSerializer;
}