// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    age: json['age'] as int,
    name: json['name'] as String,
    gender: json['gender'] as String,
    registered: json['registered'] as bool,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'age': instance.age,
      'name': instance.name,
      'gender': instance.gender,
      'registered': instance.registered,
    };
