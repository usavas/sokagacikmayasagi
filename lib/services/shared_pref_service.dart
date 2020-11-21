import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static const String _recordsKey = "RECORDS";

  SharedPrefService._();

  static SharedPrefService _instance;

  static SharedPrefService get instance =>
      _instance = _instance ?? SharedPrefService._();

  saveTheRecord(DateTime dob, bool works) {
    SharedPreferences.getInstance().then((pref) {
      // pref.setString(_recordsKey, value)
    });
  }

  static const isTermsConditionsRead = 'IS_TERMS_CONDITIONS_READ';

  setTermsAndConditionsRead(bool value) {
    SharedPreferences.getInstance()
        .then((pref) => pref.setBool(isTermsConditionsRead, value));
  }

  Future<bool> getTermsConditionsRead() async {
    return await SharedPreferences.getInstance()
        .then((pref) => pref.getBool(isTermsConditionsRead) ?? false);
  }
}
