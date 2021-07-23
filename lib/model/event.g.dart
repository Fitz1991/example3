// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Event> _$eventSerializer = new _$EventSerializer();

class _$EventSerializer implements StructuredSerializer<Event> {
  @override
  final Iterable<Type> types = const [Event, _$Event];
  @override
  final String wireName = 'Event';

  @override
  Iterable<Object> serialize(Serializers serializers, Event object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'intro',
      serializers.serialize(object.intro,
          specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date,
          specifiedType: const FullType(Timestamp)),
      'imgUrl',
      serializers.serialize(object.imgUrl,
          specifiedType: const FullType(String)),
      'place',
      serializers.serialize(object.place,
          specifiedType: const FullType(String)),
      'link',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
      'conditions',
      serializers.serialize(object.conditions,
          specifiedType: const FullType(String)),
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
  Event deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventBuilder();

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
        case 'intro':
          result.intro = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'imgUrl':
          result.imgUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'place':
          result.place = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'conditions':
          result.conditions = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$Event extends Event {
  @override
  final String id;
  @override
  final String title;
  @override
  final String intro;
  @override
  final Timestamp date;
  @override
  final String imgUrl;
  @override
  final String place;
  @override
  final String link;
  @override
  final String conditions;
  @override
  final BuiltList<VolgaSliderModel> slider;

  factory _$Event([void Function(EventBuilder) updates]) =>
      (new EventBuilder()..update(updates)).build();

  _$Event._(
      {this.id,
      this.title,
      this.intro,
      this.date,
      this.imgUrl,
      this.place,
      this.link,
      this.conditions,
      this.slider})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, 'Event', 'title');
    BuiltValueNullFieldError.checkNotNull(intro, 'Event', 'intro');
    BuiltValueNullFieldError.checkNotNull(date, 'Event', 'date');
    BuiltValueNullFieldError.checkNotNull(imgUrl, 'Event', 'imgUrl');
    BuiltValueNullFieldError.checkNotNull(place, 'Event', 'place');
    BuiltValueNullFieldError.checkNotNull(link, 'Event', 'link');
    BuiltValueNullFieldError.checkNotNull(conditions, 'Event', 'conditions');
    BuiltValueNullFieldError.checkNotNull(slider, 'Event', 'slider');
  }

  @override
  Event rebuild(void Function(EventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventBuilder toBuilder() => new EventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Event &&
        id == other.id &&
        title == other.title &&
        intro == other.intro &&
        date == other.date &&
        imgUrl == other.imgUrl &&
        place == other.place &&
        link == other.link &&
        conditions == other.conditions &&
        slider == other.slider;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), title.hashCode),
                                intro.hashCode),
                            date.hashCode),
                        imgUrl.hashCode),
                    place.hashCode),
                link.hashCode),
            conditions.hashCode),
        slider.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Event')
          ..add('id', id)
          ..add('title', title)
          ..add('intro', intro)
          ..add('date', date)
          ..add('imgUrl', imgUrl)
          ..add('place', place)
          ..add('link', link)
          ..add('conditions', conditions)
          ..add('slider', slider))
        .toString();
  }
}

class EventBuilder implements Builder<Event, EventBuilder> {
  _$Event _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _intro;
  String get intro => _$this._intro;
  set intro(String intro) => _$this._intro = intro;

  Timestamp _date;
  Timestamp get date => _$this._date;
  set date(Timestamp date) => _$this._date = date;

  String _imgUrl;
  String get imgUrl => _$this._imgUrl;
  set imgUrl(String imgUrl) => _$this._imgUrl = imgUrl;

  String _place;
  String get place => _$this._place;
  set place(String place) => _$this._place = place;

  String _link;
  String get link => _$this._link;
  set link(String link) => _$this._link = link;

  String _conditions;
  String get conditions => _$this._conditions;
  set conditions(String conditions) => _$this._conditions = conditions;

  ListBuilder<VolgaSliderModel> _slider;
  ListBuilder<VolgaSliderModel> get slider =>
      _$this._slider ??= new ListBuilder<VolgaSliderModel>();
  set slider(ListBuilder<VolgaSliderModel> slider) => _$this._slider = slider;

  EventBuilder();

  EventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _intro = $v.intro;
      _date = $v.date;
      _imgUrl = $v.imgUrl;
      _place = $v.place;
      _link = $v.link;
      _conditions = $v.conditions;
      _slider = $v.slider.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Event other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Event;
  }

  @override
  void update(void Function(EventBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Event build() {
    _$Event _$result;
    try {
      _$result = _$v ??
          new _$Event._(
              id: id,
              title: BuiltValueNullFieldError.checkNotNull(
                  title, 'Event', 'title'),
              intro: BuiltValueNullFieldError.checkNotNull(
                  intro, 'Event', 'intro'),
              date:
                  BuiltValueNullFieldError.checkNotNull(date, 'Event', 'date'),
              imgUrl: BuiltValueNullFieldError.checkNotNull(
                  imgUrl, 'Event', 'imgUrl'),
              place: BuiltValueNullFieldError.checkNotNull(
                  place, 'Event', 'place'),
              link:
                  BuiltValueNullFieldError.checkNotNull(link, 'Event', 'link'),
              conditions: BuiltValueNullFieldError.checkNotNull(
                  conditions, 'Event', 'conditions'),
              slider: slider.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'slider';
        slider.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Event', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
