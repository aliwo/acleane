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
  String routineName;
  DateTime date;

  Journal({this.id, this.userId, this.routineId, this.routineName, this.date});

  Journal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    routineId = json['routine_id'];
    routineName = json['routine_name'];
    date = DateTime.parse(json['date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['routine_id'] = this.routineId;
    data['routine_name'] = this.routineName;
    data['date'] = '${this.date.year}-${this.date.month}-${this.date.day}';
    return data;
  }
}
