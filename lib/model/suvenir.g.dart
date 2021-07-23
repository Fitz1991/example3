// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suvenir.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Suvenir> _$suvenirSerializer = new _$SuvenirSerializer();

class _$SuvenirSerializer implements StructuredSerializer<Suvenir> {
  @override
  final Iterable<Type> types = const [Suvenir, _$Suvenir];
  @override
  final String wireName = 'Suvenir';

  @override
  Iterable<Object> serialize(Serializers serializers, Suvenir object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'urlImg',
      serializers.serialize(object.urlImg,
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
  Suvenir deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SuvenirBuilder();

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
      }
    }

    return result.build();
  }
}

class _$Suvenir extends Suvenir {
  @override
  final String id;
  @override
  final String urlImg;

  factory _$Suvenir([void Function(SuvenirBuilder) updates]) =>
      (new SuvenirBuilder()..update(updates)).build();

  _$Suvenir._({this.id, this.urlImg}) : super._() {
    BuiltValueNullFieldError.checkNotNull(urlImg, 'Suvenir', 'urlImg');
  }

  @override
  Suvenir rebuild(void Function(SuvenirBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SuvenirBuilder toBuilder() => new SuvenirBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Suvenir && id == other.id && urlImg == other.urlImg;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), urlImg.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Suvenir')
          ..add('id', id)
          ..add('urlImg', urlImg))
        .toString();
  }
}

class SuvenirBuilder implements Builder<Suvenir, SuvenirBuilder> {
  _$Suvenir _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _urlImg;
  String get urlImg => _$this._urlImg;
  set urlImg(String urlImg) => _$this._urlImg = urlImg;

  SuvenirBuilder();

  SuvenirBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _urlImg = $v.urlImg;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Suvenir other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Suvenir;
  }

  @override
  void update(void Function(SuvenirBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Suvenir build() {
    final _$result = _$v ??
        new _$Suvenir._(
            id: id,
            urlImg: BuiltValueNullFieldError.checkNotNull(
                urlImg, 'Suvenir', 'urlImg'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
