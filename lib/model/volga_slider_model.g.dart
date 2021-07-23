// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volga_slider_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VolgaSliderModel> _$volgaSliderModelSerializer =
    new _$VolgaSliderModelSerializer();

class _$VolgaSliderModelSerializer
    implements StructuredSerializer<VolgaSliderModel> {
  @override
  final Iterable<Type> types = const [VolgaSliderModel, _$VolgaSliderModel];
  @override
  final String wireName = 'VolgaSliderModel';

  @override
  Iterable<Object> serialize(Serializers serializers, VolgaSliderModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];
    Object value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.desc;
    if (value != null) {
      result
        ..add('desc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  VolgaSliderModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VolgaSliderModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'desc':
          result.desc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$VolgaSliderModel extends VolgaSliderModel {
  @override
  final String title;
  @override
  final String desc;
  @override
  final String url;

  factory _$VolgaSliderModel(
          [void Function(VolgaSliderModelBuilder) updates]) =>
      (new VolgaSliderModelBuilder()..update(updates)).build();

  _$VolgaSliderModel._({this.title, this.desc, this.url}) : super._() {
    BuiltValueNullFieldError.checkNotNull(url, 'VolgaSliderModel', 'url');
  }

  @override
  VolgaSliderModel rebuild(void Function(VolgaSliderModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VolgaSliderModelBuilder toBuilder() =>
      new VolgaSliderModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VolgaSliderModel &&
        title == other.title &&
        desc == other.desc &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, title.hashCode), desc.hashCode), url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VolgaSliderModel')
          ..add('title', title)
          ..add('desc', desc)
          ..add('url', url))
        .toString();
  }
}

class VolgaSliderModelBuilder
    implements Builder<VolgaSliderModel, VolgaSliderModelBuilder> {
  _$VolgaSliderModel _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _desc;
  String get desc => _$this._desc;
  set desc(String desc) => _$this._desc = desc;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  VolgaSliderModelBuilder();

  VolgaSliderModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _desc = $v.desc;
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VolgaSliderModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VolgaSliderModel;
  }

  @override
  void update(void Function(VolgaSliderModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VolgaSliderModel build() {
    final _$result = _$v ??
        new _$VolgaSliderModel._(
            title: title,
            desc: desc,
            url: BuiltValueNullFieldError.checkNotNull(
                url, 'VolgaSliderModel', 'url'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
