// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Archive> _$archiveSerializer = new _$ArchiveSerializer();

class _$ArchiveSerializer implements StructuredSerializer<Archive> {
  @override
  final Iterable<Type> types = const [Archive, _$Archive];
  @override
  final String wireName = 'Archive';

  @override
  Iterable<Object> serialize(Serializers serializers, Archive object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'imgUrl',
      serializers.serialize(object.imgUrl,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
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
  Archive deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArchiveBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imgUrl':
          result.imgUrl = serializers.deserialize(value,
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
      }
    }

    return result.build();
  }
}

class _$Archive extends Archive {
  @override
  final String id;
  @override
  final String description;
  @override
  final String imgUrl;
  @override
  final String title;
  @override
  final String url;

  factory _$Archive([void Function(ArchiveBuilder) updates]) =>
      (new ArchiveBuilder()..update(updates)).build();

  _$Archive._({this.id, this.description, this.imgUrl, this.title, this.url})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        description, 'Archive', 'description');
    BuiltValueNullFieldError.checkNotNull(imgUrl, 'Archive', 'imgUrl');
    BuiltValueNullFieldError.checkNotNull(title, 'Archive', 'title');
    BuiltValueNullFieldError.checkNotNull(url, 'Archive', 'url');
  }

  @override
  Archive rebuild(void Function(ArchiveBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArchiveBuilder toBuilder() => new ArchiveBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Archive &&
        id == other.id &&
        description == other.description &&
        imgUrl == other.imgUrl &&
        title == other.title &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, id.hashCode), description.hashCode),
                imgUrl.hashCode),
            title.hashCode),
        url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Archive')
          ..add('id', id)
          ..add('description', description)
          ..add('imgUrl', imgUrl)
          ..add('title', title)
          ..add('url', url))
        .toString();
  }
}

class ArchiveBuilder implements Builder<Archive, ArchiveBuilder> {
  _$Archive _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _imgUrl;
  String get imgUrl => _$this._imgUrl;
  set imgUrl(String imgUrl) => _$this._imgUrl = imgUrl;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  ArchiveBuilder();

  ArchiveBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _description = $v.description;
      _imgUrl = $v.imgUrl;
      _title = $v.title;
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Archive other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Archive;
  }

  @override
  void update(void Function(ArchiveBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Archive build() {
    final _$result = _$v ??
        new _$Archive._(
            id: id,
            description: BuiltValueNullFieldError.checkNotNull(
                description, 'Archive', 'description'),
            imgUrl: BuiltValueNullFieldError.checkNotNull(
                imgUrl, 'Archive', 'imgUrl'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, 'Archive', 'title'),
            url: BuiltValueNullFieldError.checkNotNull(url, 'Archive', 'url'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
