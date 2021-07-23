// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Main> _$mainSerializer = new _$MainSerializer();

class _$MainSerializer implements StructuredSerializer<Main> {
  @override
  final Iterable<Type> types = const [Main, _$Main];
  @override
  final String wireName = 'Main';

  @override
  Iterable<Object> serialize(Serializers serializers, Main object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'about',
      serializers.serialize(object.about,
          specifiedType: const FullType(String)),
      'slider',
      serializers.serialize(object.slider,
          specifiedType: const FullType(
              BuiltList, const [const FullType(VolgaSliderModel)])),
      'sliderWithDesc',
      serializers.serialize(object.sliderWithDesc,
          specifiedType: const FullType(
              BuiltList, const [const FullType(VolgaSliderModel)])),
      'slogan',
      serializers.serialize(object.slogan,
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
  Main deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MainBuilder();

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
        case 'about':
          result.about = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'slider':
          result.slider.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VolgaSliderModel)]))
              as BuiltList<Object>);
          break;
        case 'sliderWithDesc':
          result.sliderWithDesc.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VolgaSliderModel)]))
              as BuiltList<Object>);
          break;
        case 'slogan':
          result.slogan = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Main extends Main {
  @override
  final String id;
  @override
  final String about;
  @override
  final BuiltList<VolgaSliderModel> slider;
  @override
  final BuiltList<VolgaSliderModel> sliderWithDesc;
  @override
  final String slogan;

  factory _$Main([void Function(MainBuilder) updates]) =>
      (new MainBuilder()..update(updates)).build();

  _$Main._({this.id, this.about, this.slider, this.sliderWithDesc, this.slogan})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(about, 'Main', 'about');
    BuiltValueNullFieldError.checkNotNull(slider, 'Main', 'slider');
    BuiltValueNullFieldError.checkNotNull(
        sliderWithDesc, 'Main', 'sliderWithDesc');
    BuiltValueNullFieldError.checkNotNull(slogan, 'Main', 'slogan');
  }

  @override
  Main rebuild(void Function(MainBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MainBuilder toBuilder() => new MainBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Main &&
        id == other.id &&
        about == other.about &&
        slider == other.slider &&
        sliderWithDesc == other.sliderWithDesc &&
        slogan == other.slogan;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), about.hashCode), slider.hashCode),
            sliderWithDesc.hashCode),
        slogan.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Main')
          ..add('id', id)
          ..add('about', about)
          ..add('slider', slider)
          ..add('sliderWithDesc', sliderWithDesc)
          ..add('slogan', slogan))
        .toString();
  }
}

class MainBuilder implements Builder<Main, MainBuilder> {
  _$Main _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _about;
  String get about => _$this._about;
  set about(String about) => _$this._about = about;

  ListBuilder<VolgaSliderModel> _slider;
  ListBuilder<VolgaSliderModel> get slider =>
      _$this._slider ??= new ListBuilder<VolgaSliderModel>();
  set slider(ListBuilder<VolgaSliderModel> slider) => _$this._slider = slider;

  ListBuilder<VolgaSliderModel> _sliderWithDesc;
  ListBuilder<VolgaSliderModel> get sliderWithDesc =>
      _$this._sliderWithDesc ??= new ListBuilder<VolgaSliderModel>();
  set sliderWithDesc(ListBuilder<VolgaSliderModel> sliderWithDesc) =>
      _$this._sliderWithDesc = sliderWithDesc;

  String _slogan;
  String get slogan => _$this._slogan;
  set slogan(String slogan) => _$this._slogan = slogan;

  MainBuilder();

  MainBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _about = $v.about;
      _slider = $v.slider.toBuilder();
      _sliderWithDesc = $v.sliderWithDesc.toBuilder();
      _slogan = $v.slogan;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Main other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Main;
  }

  @override
  void update(void Function(MainBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Main build() {
    _$Main _$result;
    try {
      _$result = _$v ??
          new _$Main._(
              id: id,
              about:
                  BuiltValueNullFieldError.checkNotNull(about, 'Main', 'about'),
              slider: slider.build(),
              sliderWithDesc: sliderWithDesc.build(),
              slogan: BuiltValueNullFieldError.checkNotNull(
                  slogan, 'Main', 'slogan'));
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'slider';
        slider.build();
        _$failedField = 'sliderWithDesc';
        sliderWithDesc.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Main', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
