// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volga_test.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VolgaTest> _$volgaTestSerializer = new _$VolgaTestSerializer();

class _$VolgaTestSerializer implements StructuredSerializer<VolgaTest> {
  @override
  final Iterable<Type> types = const [VolgaTest, _$VolgaTest];
  @override
  final String wireName = 'VolgaTest';

  @override
  Iterable<Object> serialize(Serializers serializers, VolgaTest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'imageUrl',
      serializers.serialize(object.imageUrl,
          specifiedType: const FullType(String)),
      'quiz',
      serializers.serialize(object.quiz,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Quiz)])),
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
  VolgaTest deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VolgaTestBuilder();

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
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'quiz':
          result.quiz.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Quiz)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$VolgaTest extends VolgaTest {
  @override
  final String id;
  @override
  final String title;
  @override
  final String imageUrl;
  @override
  final BuiltList<Quiz> quiz;

  factory _$VolgaTest([void Function(VolgaTestBuilder) updates]) =>
      (new VolgaTestBuilder()..update(updates)).build();

  _$VolgaTest._({this.id, this.title, this.imageUrl, this.quiz}) : super._() {
    BuiltValueNullFieldError.checkNotNull(title, 'VolgaTest', 'title');
    BuiltValueNullFieldError.checkNotNull(imageUrl, 'VolgaTest', 'imageUrl');
    BuiltValueNullFieldError.checkNotNull(quiz, 'VolgaTest', 'quiz');
  }

  @override
  VolgaTest rebuild(void Function(VolgaTestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VolgaTestBuilder toBuilder() => new VolgaTestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VolgaTest &&
        id == other.id &&
        title == other.title &&
        imageUrl == other.imageUrl &&
        quiz == other.quiz;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), title.hashCode), imageUrl.hashCode),
        quiz.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VolgaTest')
          ..add('id', id)
          ..add('title', title)
          ..add('imageUrl', imageUrl)
          ..add('quiz', quiz))
        .toString();
  }
}

class VolgaTestBuilder implements Builder<VolgaTest, VolgaTestBuilder> {
  _$VolgaTest _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  ListBuilder<Quiz> _quiz;
  ListBuilder<Quiz> get quiz => _$this._quiz ??= new ListBuilder<Quiz>();
  set quiz(ListBuilder<Quiz> quiz) => _$this._quiz = quiz;

  VolgaTestBuilder();

  VolgaTestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _imageUrl = $v.imageUrl;
      _quiz = $v.quiz.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VolgaTest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VolgaTest;
  }

  @override
  void update(void Function(VolgaTestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VolgaTest build() {
    _$VolgaTest _$result;
    try {
      _$result = _$v ??
          new _$VolgaTest._(
              id: id,
              title: BuiltValueNullFieldError.checkNotNull(
                  title, 'VolgaTest', 'title'),
              imageUrl: BuiltValueNullFieldError.checkNotNull(
                  imageUrl, 'VolgaTest', 'imageUrl'),
              quiz: quiz.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'quiz';
        quiz.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VolgaTest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
