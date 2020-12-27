// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Picture _$PictureFromJson(Map<String, dynamic> json) {
  return Picture(
    id: json['id'] as int,
    userId: json['userId'] as int,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$PictureToJson(Picture instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'url': instance.url,
    };
