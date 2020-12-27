// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trouble.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trouble _$TroubleFromJson(Map<String, dynamic> json) {
  return Trouble(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$TroubleToJson(Trouble instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
