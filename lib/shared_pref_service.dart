import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static const String _recordsKey = "RECORDS";

  saveTheRecord(DateTime dob, bool works) {
    SharedPreferences.getInstance().then((pref) {
      // pref.setString(_recordsKey, value)
    });
  }
}
