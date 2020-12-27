import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

// ignore_for_file: unnecessary_this
// ignore_for_file: unnecessary_new
// ignore_for_file: prefer_collection_literals
// ignore_for_file: omit_local_variable_types

@JsonSerializable()
class User {
  int id;
  int age;
  String name;
  String gender; // 이거 enum 같은거로 할 수 없나?
  bool registered;

  User({this.id, this.age, this.name, this.gender, this.registered});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
