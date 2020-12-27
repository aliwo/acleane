import 'package:json_annotation/json_annotation.dart';
part 'user_routine.g.dart';

// ignore_for_file: unnecessary_this
// ignore_for_file: unnecessary_new
// ignore_for_file: prefer_collection_literals
// ignore_for_file: omit_local_variable_types

@JsonSerializable()
class UserRoutine {
  int id;
  int routineId;
  String amount;

  UserRoutine({this.id, this.routineId, this.amount});

  UserRoutine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    routineId = json['routine_id'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['routine_id'] = this.routineId;
    data['amount'] = this.amount;
    return data;
  }
}
