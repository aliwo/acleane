// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Routine _$RoutineFromJson(Map<String, dynamic> json) {
  return Routine(
    id: json['id'] as int,
    name: json['name'] as String,
    amounts: (json['amounts'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RoutineToJson(Routine instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amounts': instance.amounts,
    };
