// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_routine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRoutine _$UserRoutineFromJson(Map<String, dynamic> json) {
  return UserRoutine(
    id: json['id'] as int,
    routineId: json['routineId'] as int,
    amount: json['amount'] as String,
  );
}

Map<String, dynamic> _$UserRoutineToJson(UserRoutine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'routineId': instance.routineId,
      'amount': instance.amount,
    };
