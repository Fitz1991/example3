// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Member> _$memberSerializer = new _$MemberSerializer();

class _$MemberSerializer implements StructuredSerializer<Member> {
  @override
  final Iterable<Type> types = const [Member, _$Member];
  @override
  final String wireName = 'Member';

  @override
  Iterable<Object> serialize(Serializers serializers, Member object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'socialUrl',
      serializers.serialize(object.socialUrl,
          specifiedType: const FullType(String)),
      'socialUrlPath',
      serializers.serialize(object.socialUrlPath,
          specifiedType: const FullType(String)),
      'imgUrl',
      serializers.serialize(object.imgUrl,
          specifiedType: const FullType(String)),
      'surname',
      serializers.serialize(object.surname,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'secondName',
      serializers.serialize(object.secondName,
          specifiedType: const FullType(String)),
      'position',
      serializers.serialize(object.position,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
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
  Member deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MemberBuilder();

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
        case 'socialUrl':
          result.socialUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'socialUrlPath':
          result.socialUrlPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imgUrl':
          result.imgUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'surname':
          result.surname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'secondName':
          result.secondName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'position':
          result.position = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Member extends Member {
  @override
  final String id;
  @override
  final String socialUrl;
  @override
  final String socialUrlPath;
  @override
  final String imgUrl;
  @override
  final String surname;
  @override
  final String name;
  @override
  final String secondName;
  @override
  final String position;
  @override
  final String description;

  factory _$Member([void Function(MemberBuilder) updates]) =>
      (new MemberBuilder()..update(updates)).build();

  _$Member._(
      {this.id,
      this.socialUrl,
      this.socialUrlPath,
      this.imgUrl,
      this.surname,
      this.name,
      this.secondName,
      this.position,
      this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(socialUrl, 'Member', 'socialUrl');
    BuiltValueNullFieldError.checkNotNull(
        socialUrlPath, 'Member', 'socialUrlPath');
    BuiltValueNullFieldError.checkNotNull(imgUrl, 'Member', 'imgUrl');
    BuiltValueNullFieldError.checkNotNull(surname, 'Member', 'surname');
    BuiltValueNullFieldError.checkNotNull(name, 'Member', 'name');
    BuiltValueNullFieldError.checkNotNull(secondName, 'Member', 'secondName');
    BuiltValueNullFieldError.checkNotNull(position, 'Member', 'position');
    BuiltValueNullFieldError.checkNotNull(description, 'Member', 'description');
  }

  @override
  Member rebuild(void Function(MemberBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MemberBuilder toBuilder() => new MemberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Member &&
        id == other.id &&
        socialUrl == other.socialUrl &&
        socialUrlPath == other.socialUrlPath &&
        imgUrl == other.imgUrl &&
        surname == other.surname &&
        name == other.name &&
        secondName == other.secondName &&
        position == other.position &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), socialUrl.hashCode),
                                socialUrlPath.hashCode),
                            imgUrl.hashCode),
                        surname.hashCode),
                    name.hashCode),
                secondName.hashCode),
            position.hashCode),
        description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Member')
          ..add('id', id)
          ..add('socialUrl', socialUrl)
          ..add('socialUrlPath', socialUrlPath)
          ..add('imgUrl', imgUrl)
          ..add('surname', surname)
          ..add('name', name)
          ..add('secondName', secondName)
          ..add('position', position)
          ..add('description', description))
        .toString();
  }
}

class MemberBuilder implements Builder<Member, MemberBuilder> {
  _$Member _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _socialUrl;
  String get socialUrl => _$this._socialUrl;
  set socialUrl(String socialUrl) => _$this._socialUrl = socialUrl;

  String _socialUrlPath;
  String get socialUrlPath => _$this._socialUrlPath;
  set socialUrlPath(String socialUrlPath) =>
      _$this._socialUrlPath = socialUrlPath;

  String _imgUrl;
  String get imgUrl => _$this._imgUrl;
  set imgUrl(String imgUrl) => _$this._imgUrl = imgUrl;

  String _surname;
  String get surname => _$this._surname;
  set surname(String surname) => _$this._surname = surname;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _secondName;
  String get secondName => _$this._secondName;
  set secondName(String secondName) => _$this._secondName = secondName;

  String _position;
  String get position => _$this._position;
  set position(String position) => _$this._position = position;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  MemberBuilder();

  MemberBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _socialUrl = $v.socialUrl;
      _socialUrlPath = $v.socialUrlPath;
      _imgUrl = $v.imgUrl;
      _surname = $v.surname;
      _name = $v.name;
      _secondName = $v.secondName;
      _position = $v.position;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Member other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Member;
  }

  @override
  void update(void Function(MemberBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Member build() {
    final _$result = _$v ??
        new _$Member._(
            id: id,
            socialUrl: BuiltValueNullFieldError.checkNotNull(
                socialUrl, 'Member', 'socialUrl'),
            socialUrlPath: BuiltValueNullFieldError.checkNotNull(
                socialUrlPath, 'Member', 'socialUrlPath'),
            imgUrl: BuiltValueNullFieldError.checkNotNull(
                imgUrl, 'Member', 'imgUrl'),
            surname: BuiltValueNullFieldError.checkNotNull(
                surname, 'Member', 'surname'),
            name: BuiltValueNullFieldError.checkNotNull(name, 'Member', 'name'),
            secondName: BuiltValueNullFieldError.checkNotNull(
                secondName, 'Member', 'secondName'),
            position: BuiltValueNullFieldError.checkNotNull(
                position, 'Member', 'position'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, 'Member', 'description'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
