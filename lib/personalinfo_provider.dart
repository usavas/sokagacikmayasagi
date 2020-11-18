import 'package:flutter/cupertino.dart';

class PersonalInfoProvider with ChangeNotifier {
  DateTime dateOfBirth;

  bool works;

  setDateOfBirth(DateTime dob) {
    dateOfBirth = dob;
    notifyListeners();
  }

  setWorks(bool value) {
    works = value;
    notifyListeners();
  }
}
