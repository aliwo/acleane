import 'package:json_annotation/json_annotation.dart';
part 'routine.g.dart';

// ignore_for_file: unnecessary_this
// ignore_for_file: unnecessary_new
// ignore_for_file: prefer_collection_literals
// ignore_for_file: omit_local_variable_types

@JsonSerializable()
class Routine {
  int id;
  String name;
  List<String> amounts;

  Routine({this.id, this.name, this.amounts});

  Routine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amounts = json['amounts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['amounts'] = this.amounts;
    return data;
  }
}
