// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Journal _$JournalFromJson(Map<String, dynamic> json) {
  return Journal(
    id: json['id'] as int,
  )
    ..userId = json['userId'] as int
    ..routineId = json['routineId'] as int
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String);
}

Map<String, dynamic> _$JournalToJson(Journal instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'routineId': instance.routineId,
      'date': instance.date?.toIso8601String(),
    };
