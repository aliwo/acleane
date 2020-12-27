import 'package:json_annotation/json_annotation.dart';
part 'journal.g.dart';

// ignore_for_file: unnecessary_this
// ignore_for_file: unnecessary_new
// ignore_for_file: prefer_collection_literals
// ignore_for_file: omit_local_variable_types

@JsonSerializable()
class Journal {
  int id;
  int userId;
  int routineId;
  DateTime date;

  Journal({this.id});

  Journal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    routineId = json['id'];
    date = DateTime.parse(json['date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['routine_id'] = this.routineId;
    data['date'] = '${this.date.year}-${this.date.month}-${this.date.day}';
    return data;
  }
}
