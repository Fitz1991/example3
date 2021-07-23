// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_class.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MasterClass> _$masterClassSerializer = new _$MasterClassSerializer();

class _$MasterClassSerializer implements StructuredSerializer<MasterClass> {
  @override
  final Iterable<Type> types = const [MasterClass, _$MasterClass];
  @override
  final String wireName = 'MasterClass';

  @override
  Iterable<Object> serialize(Serializers serializers, MasterClass object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'date',
      serializers.serialize(object.date,
          specifiedType: const FullType(Timestamp)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
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
  MasterClass deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MasterClassBuilder();

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
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MasterClass extends MasterClass {
  @override
  final String id;
  @override
  final Timestamp date;
  @override
  final String description;
  @override
  final String url;
  @override
  final String title;

  factory _$MasterClass([void Function(MasterClassBuilder) updates]) =>
      (new MasterClassBuilder()..update(updates)).build();

  _$MasterClass._({this.id, this.date, this.description, this.url, this.title})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(date, 'MasterClass', 'date');
    BuiltValueNullFieldError.checkNotNull(
        description, 'MasterClass', 'description');
    BuiltValueNullFieldError.checkNotNull(url, 'MasterClass', 'url');
    BuiltValueNullFieldError.checkNotNull(title, 'MasterClass', 'title');
  }

  @override
  MasterClass rebuild(void Function(MasterClassBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MasterClassBuilder toBuilder() => new MasterClassBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MasterClass &&
        id == other.id &&
        date == other.date &&
        description == other.description &&
        url == other.url &&
        title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), date.hashCode), description.hashCode),
            url.hashCode),
        title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MasterClass')
          ..add('id', id)
          ..add('date', date)
          ..add('description', description)
          ..add('url', url)
          ..add('title', title))
        .toString();
  }
}

class MasterClassBuilder implements Builder<MasterClass, MasterClassBuilder> {
  _$MasterClass _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  Timestamp _date;
  Timestamp get date => _$this._date;
  set date(Timestamp date) => _$this._date = date;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  MasterClassBuilder();

  MasterClassBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _date = $v.date;
      _description = $v.description;
      _url = $v.url;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MasterClass other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MasterClass;
  }

  @override
  void update(void Function(MasterClassBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MasterClass build() {
    final _$result = _$v ??
        new _$MasterClass._(
            id: id,
            date: BuiltValueNullFieldError.checkNotNull(
                date, 'MasterClass', 'date'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, 'MasterClass', 'description'),
            url: BuiltValueNullFieldError.checkNotNull(
                url, 'MasterClass', 'url'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, 'MasterClass', 'title'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
