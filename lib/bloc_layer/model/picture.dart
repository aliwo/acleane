import 'package:json_annotation/json_annotation.dart';
part 'picture.g.dart';

// ignore_for_file: unnecessary_this
// ignore_for_file: unnecessary_new
// ignore_for_file: prefer_collection_literals
// ignore_for_file: omit_local_variable_types

@JsonSerializable()
class Picture {
  int id;
  int userId;
  String url;

  Picture({this.id, this.userId, this.url});

  Picture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['url'] = this.url;
    return data;
  }
}
