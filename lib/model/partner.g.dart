// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Partner> _$partnerSerializer = new _$PartnerSerializer();

class _$PartnerSerializer implements StructuredSerializer<Partner> {
  @override
  final Iterable<Type> types = const [Partner, _$Partner];
  @override
  final String wireName = 'Partner';

  @override
  Iterable<Object> serialize(Serializers serializers, Partner object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'urlImg',
      serializers.serialize(object.urlImg,
          specifiedType: const FullType(String)),
      'urlPartner',
      serializers.serialize(object.urlPartner,
          specifiedType: const FullType(String)),
    ];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Partner deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PartnerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'urlImg':
          result.urlImg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'urlPartner':
          result.urlPartner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Partner extends Partner {
  @override
  final String id;
  @override
  final String urlImg;
  @override
  final String urlPartner;

  factory _$Partner([void Function(PartnerBuilder) updates]) =>
      (new PartnerBuilder()..update(updates)).build();

  _$Partner._({this.id, this.urlImg, this.urlPartner}) : super._() {
    BuiltValueNullFieldError.checkNotNull(urlImg, 'Partner', 'urlImg');
    BuiltValueNullFieldError.checkNotNull(urlPartner, 'Partner', 'urlPartner');
  }

  @override
  Partner rebuild(void Function(PartnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PartnerBuilder toBuilder() => new PartnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Partner &&
        id == other.id &&
        urlImg == other.urlImg &&
        urlPartner == other.urlPartner;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), urlImg.hashCode), urlPartner.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Partner')
          ..add('id', id)
          ..add('urlImg', urlImg)
          ..add('urlPartner', urlPartner))
        .toString();
  }
}

class PartnerBuilder implements Builder<Partner, PartnerBuilder> {
  _$Partner _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _urlImg;
  String get urlImg => _$this._urlImg;
  set urlImg(String urlImg) => _$this._urlImg = urlImg;

  String _urlPartner;
  String get urlPartner => _$this._urlPartner;
  set urlPartner(String urlPartner) => _$this._urlPartner = urlPartner;

  PartnerBuilder();

  PartnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _urlImg = $v.urlImg;
      _urlPartner = $v.urlPartner;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Partner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Partner;
  }

  @override
  void update(void Function(PartnerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Partner build() {
    final _$result = _$v ??
        new _$Partner._(
            id: id,
            urlImg: BuiltValueNullFieldError.checkNotNull(
                urlImg, 'Partner', 'urlImg'),
            urlPartner: BuiltValueNullFieldError.checkNotNull(
                urlPartner, 'Partner', 'urlPartner'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
