// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Quiz> _$quizSerializer = new _$QuizSerializer();

class _$QuizSerializer implements StructuredSerializer<Quiz> {
  @override
  final Iterable<Type> types = const [Quiz, _$Quiz];
  @override
  final String wireName = 'Quiz';

  @override
  Iterable<Object> serialize(Serializers serializers, Quiz object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'imageUrl',
      serializers.serialize(object.imageUrl,
          specifiedType: const FullType(String)),
      'question',
      serializers.serialize(object.question,
          specifiedType: const FullType(String)),
      'rightAnswer',
      serializers.serialize(object.rightAnswer,
          specifiedType: const FullType(String)),
      'wrongAnswers',
      serializers.serialize(object.wrongAnswers,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  Quiz deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuizBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rightAnswer':
          result.rightAnswer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wrongAnswers':
          result.wrongAnswers.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$Quiz extends Quiz {
  @override
  final String imageUrl;
  @override
  final String question;
  @override
  final String rightAnswer;
  @override
  final BuiltList<String> wrongAnswers;

  factory _$Quiz([void Function(QuizBuilder) updates]) =>
      (new QuizBuilder()..update(updates)).build();

  _$Quiz._({this.imageUrl, this.question, this.rightAnswer, this.wrongAnswers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(imageUrl, 'Quiz', 'imageUrl');
    BuiltValueNullFieldError.checkNotNull(question, 'Quiz', 'question');
    BuiltValueNullFieldError.checkNotNull(rightAnswer, 'Quiz', 'rightAnswer');
    BuiltValueNullFieldError.checkNotNull(wrongAnswers, 'Quiz', 'wrongAnswers');
  }

  @override
  Quiz rebuild(void Function(QuizBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuizBuilder toBuilder() => new QuizBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Quiz &&
        imageUrl == other.imageUrl &&
        question == other.question &&
        rightAnswer == other.rightAnswer &&
        wrongAnswers == other.wrongAnswers;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, imageUrl.hashCode), question.hashCode),
            rightAnswer.hashCode),
        wrongAnswers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Quiz')
          ..add('imageUrl', imageUrl)
          ..add('question', question)
          ..add('rightAnswer', rightAnswer)
          ..add('wrongAnswers', wrongAnswers))
        .toString();
  }
}

class QuizBuilder implements Builder<Quiz, QuizBuilder> {
  _$Quiz _$v;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  String _question;
  String get question => _$this._question;
  set question(String question) => _$this._question = question;

  String _rightAnswer;
  String get rightAnswer => _$this._rightAnswer;
  set rightAnswer(String rightAnswer) => _$this._rightAnswer = rightAnswer;

  ListBuilder<String> _wrongAnswers;
  ListBuilder<String> get wrongAnswers =>
      _$this._wrongAnswers ??= new ListBuilder<String>();
  set wrongAnswers(ListBuilder<String> wrongAnswers) =>
      _$this._wrongAnswers = wrongAnswers;

  QuizBuilder();

  QuizBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imageUrl = $v.imageUrl;
      _question = $v.question;
      _rightAnswer = $v.rightAnswer;
      _wrongAnswers = $v.wrongAnswers.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Quiz other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Quiz;
  }

  @override
  void update(void Function(QuizBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Quiz build() {
    _$Quiz _$result;
    try {
      _$result = _$v ??
          new _$Quiz._(
              imageUrl: BuiltValueNullFieldError.checkNotNull(
                  imageUrl, 'Quiz', 'imageUrl'),
              question: BuiltValueNullFieldError.checkNotNull(
                  question, 'Quiz', 'question'),
              rightAnswer: BuiltValueNullFieldError.checkNotNull(
                  rightAnswer, 'Quiz', 'rightAnswer'),
              wrongAnswers: wrongAnswers.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'wrongAnswers';
        wrongAnswers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Quiz', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
