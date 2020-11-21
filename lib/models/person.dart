import 'package:age/age.dart';

class Person {
  DateTime dob;
  bool works;

  Person({this.dob, this.works = false});

  int getAge() {
    return Age.dateDifference(
            fromDate: this.dob, toDate: DateTime.now(), includeToDate: false)
        .years;
  }

  bool isUnder20() {
    bool bornAfter2000 = dob.isAfter(DateTime(1999, 12, 31));
    return bornAfter2000;
  }

  bool isAbove65() {
    return Age.dateDifference(
                fromDate: this.dob,
                toDate: DateTime.now(),
                includeToDate: false)
            .years >=
        65;
  }

  String dobToString() {
    return '${this.dob.day}/${this.dob.month}/${this.dob.year}';
  }
}
