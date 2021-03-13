import 'package:json_annotation/json_annotation.dart';
part 'trouble.g.dart';

// ignore_for_file: unnecessary_this
// ignore_for_file: unnecessary_new
// ignore_for_file: prefer_collection_literals
// ignore_for_file: omit_local_variable_types

@JsonSerializable()
class Trouble {
  int id;
  String name;

  Trouble({this.id, this.name});

  Trouble.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
