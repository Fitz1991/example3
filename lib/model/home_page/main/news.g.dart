// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<News> _$newsSerializer = new _$NewsSerializer();

class _$NewsSerializer implements StructuredSerializer<News> {
  @override
  final Iterable<Type> types = const [News, _$News];
  @override
  final String wireName = 'News';

  @override
  Iterable<Object> serialize(Serializers serializers, News object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date,
          specifiedType: const FullType(Timestamp)),
      'slider',
      serializers.serialize(object.slider,
          specifiedType: const FullType(
              BuiltList, const [const FullType(VolgaSliderModel)])),
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
  News deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewsBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'slider':
          result.slider.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VolgaSliderModel)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$News extends News {
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final Timestamp date;
  @override
  final BuiltList<VolgaSliderModel> slider;

  factory _$News([void Function(NewsBuilder) updates]) =>
      (new NewsBuilder()..update(updates)).build();

  _$News._({this.id, this.title, this.description, this.date, this.slider})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, 'News', 'title');
    BuiltValueNullFieldError.checkNotNull(description, 'News', 'description');
    BuiltValueNullFieldError.checkNotNull(date, 'News', 'date');
    BuiltValueNullFieldError.checkNotNull(slider, 'News', 'slider');
  }

  @override
  News rebuild(void Function(NewsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsBuilder toBuilder() => new NewsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is News &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        date == other.date &&
        slider == other.slider;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), title.hashCode), description.hashCode),
            date.hashCode),
        slider.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('News')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('date', date)
          ..add('slider', slider))
        .toString();
  }
}

class NewsBuilder implements Builder<News, NewsBuilder> {
  _$News _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  Timestamp _date;
  Timestamp get date => _$this._date;
  set date(Timestamp date) => _$this._date = date;

  ListBuilder<VolgaSliderModel> _slider;
  ListBuilder<VolgaSliderModel> get slider =>
      _$this._slider ??= new ListBuilder<VolgaSliderModel>();
  set slider(ListBuilder<VolgaSliderModel> slider) => _$this._slider = slider;

  NewsBuilder();

  NewsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _date = $v.date;
      _slider = $v.slider.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(News other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$News;
  }

  @override
  void update(void Function(NewsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$News build() {
    _$News _$result;
    try {
      _$result = _$v ??
          new _$News._(
              id: id,
              title:
                  BuiltValueNullFieldError.checkNotNull(title, 'News', 'title'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, 'News', 'description'),
              date: BuiltValueNullFieldError.checkNotNull(date, 'News', 'date'),
              slider: slider.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'slider';
        slider.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'News', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
