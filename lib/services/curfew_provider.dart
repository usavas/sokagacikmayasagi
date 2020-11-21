import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:sokagacikmayasagi/models/person.dart';
import 'package:sokagacikmayasagi/models/time_left.dart';

class CurfewProvider with ChangeNotifier {
  TimeLeft timeLeft;
  bool canGoOut;
  Person person = Person();

  initializePerson() {
    person = Person();
  }

  setDateOfBirth(DateTime dob) {
    person.dob = dob;
    notifyListeners();
  }

  setWorks(bool value) {
    person.works = value;
    notifyListeners();
  }

  Stream<TimeLeft> get getTimeLeft async* {
    while (timeLeft != null && timeLeft.isTimeLeft()) {
      await Future.delayed(Duration(minutes: 1), () {
        timeLeft.decreaseMinutes();
      });
      yield timeLeft;
    }
  }
}
