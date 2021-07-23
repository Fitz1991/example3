import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimestampSerializer
    implements PrimitiveSerializer<Timestamp> {

  @override
  Object serialize(Serializers serializers, Timestamp timestamp,
      {FullType specifiedType = FullType.unspecified}) {
    return timestamp.microsecondsSinceEpoch;
  }

  @override
  Timestamp deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return serialized as Timestamp;
  }

  @override
  Iterable<Type> get types => [Timestamp];

  @override
  String get wireName => 'Timestamp';
}