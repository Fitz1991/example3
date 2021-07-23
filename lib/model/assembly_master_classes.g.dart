// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assembly_master_classes.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssemblyMasterClasses> _$assemblyMasterClassesSerializer =
    new _$AssemblyMasterClassesSerializer();

class _$AssemblyMasterClassesSerializer
    implements StructuredSerializer<AssemblyMasterClasses> {
  @override
  final Iterable<Type> types = const [
    AssemblyMasterClasses,
    _$AssemblyMasterClasses
  ];
  @override
  final String wireName = 'AssemblyMasterClasses';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AssemblyMasterClasses object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'lessons',
      serializers.serialize(object.lessons,
          specifiedType:
              const FullType(BuiltList, const [const FullType(MasterClass)])),
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
  AssemblyMasterClasses deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AssemblyMasterClassesBuilder();

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
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lessons':
          result.lessons.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MasterClass)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$AssemblyMasterClasses extends AssemblyMasterClasses {
  @override
  final String id;
  @override
  final String title;
  @override
  final String url;
  @override
  final BuiltList<MasterClass> lessons;

  factory _$AssemblyMasterClasses(
          [void Function(AssemblyMasterClassesBuilder) updates]) =>
      (new AssemblyMasterClassesBuilder()..update(updates)).build();

  _$AssemblyMasterClasses._({this.id, this.title, this.url, this.lessons})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        title, 'AssemblyMasterClasses', 'title');
    BuiltValueNullFieldError.checkNotNull(url, 'AssemblyMasterClasses', 'url');
    BuiltValueNullFieldError.checkNotNull(
        lessons, 'AssemblyMasterClasses', 'lessons');
  }

  @override
  AssemblyMasterClasses rebuild(
          void Function(AssemblyMasterClassesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssemblyMasterClassesBuilder toBuilder() =>
      new AssemblyMasterClassesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssemblyMasterClasses &&
        id == other.id &&
        title == other.title &&
        url == other.url &&
        lessons == other.lessons;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, id.hashCode), title.hashCode), url.hashCode),
        lessons.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssemblyMasterClasses')
          ..add('id', id)
          ..add('title', title)
          ..add('url', url)
          ..add('lessons', lessons))
        .toString();
  }
}

class AssemblyMasterClassesBuilder
    implements Builder<AssemblyMasterClasses, AssemblyMasterClassesBuilder> {
  _$AssemblyMasterClasses _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  ListBuilder<MasterClass> _lessons;
  ListBuilder<MasterClass> get lessons =>
      _$this._lessons ??= new ListBuilder<MasterClass>();
  set lessons(ListBuilder<MasterClass> lessons) => _$this._lessons = lessons;

  AssemblyMasterClassesBuilder();

  AssemblyMasterClassesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _url = $v.url;
      _lessons = $v.lessons.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssemblyMasterClasses other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssemblyMasterClasses;
  }

  @override
  void update(void Function(AssemblyMasterClassesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssemblyMasterClasses build() {
    _$AssemblyMasterClasses _$result;
    try {
      _$result = _$v ??
          new _$AssemblyMasterClasses._(
              id: id,
              title: BuiltValueNullFieldError.checkNotNull(
                  title, 'AssemblyMasterClasses', 'title'),
              url: BuiltValueNullFieldError.checkNotNull(
                  url, 'AssemblyMasterClasses', 'url'),
              lessons: lessons.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'lessons';
        lessons.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AssemblyMasterClasses', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
