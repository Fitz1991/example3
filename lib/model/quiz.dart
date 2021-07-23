import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serialazers.dart';

part 'quiz.g.dart';

abstract class Quiz implements Built<Quiz, QuizBuilder> {
  String get imageUrl;
  String get question;
  String get rightAnswer;
  BuiltList<String> get wrongAnswers;

  Quiz._();
  factory Quiz([void Function(QuizBuilder) updates]) = _$Quiz;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Quiz.serializer, this);
  }

  static Quiz fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Quiz.serializer, json);
  }

  static Serializer<Quiz> get serializer => _$quizSerializer;
}