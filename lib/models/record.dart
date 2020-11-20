import 'dart:convert';

import 'package:age/age.dart';

class Record {
  DateTime dob;
  bool works;
  int age;

  Record(this.dob, this.works) {
    this.age = Age.dateDifference(fromDate: dob, toDate: DateTime.now()).years;
  }

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(DateTime.parse(json['dob']), json['works']);
  }

  Map<String, dynamic> toJson() =>
      {'dob': this.dob.toIso8601String(), 'works': this.works, 'age': this.age};
}
