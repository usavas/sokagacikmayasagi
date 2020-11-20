import 'package:age/age.dart';

class CurfewService {
  CurfewService._();

  static CurfewService _instance;

  static CurfewService get getInstance {
    return _instance = _instance ?? CurfewService._();
  }

  bool isUnder20(DateTime dob) {
    int diffInDays =
        Age.dateDifference(fromDate: dob, toDate: DateTime(2000)).days;
    bool val = (diffInDays <= 0);
    return val;
  }

  bool isAbove65(DateTime dob) {
    return Age.dateDifference(
                fromDate: dob, toDate: DateTime.now(), includeToDate: false)
            .years >=
        65;
  }

  bool _isWeekend(DateTime date) {
    return (date.day == DateTime.saturday || date.day == DateTime.sunday);
  }

  static const int _weekendFreeStartHour = 10;
  static const int _weekendFreeEndhour = 20;

  static const int _over65StartHour = 10;
  static const int _over65EndHour = 13;

  static const int _under20StartHour = 13;
  static const int _under20EndHour = 16;

  bool canGoOut(DateTime dob, bool works) {
    bool _isWeekendField = _isWeekend(DateTime.now());
    bool _isUnder20 = isUnder20(dob);
    bool _isAbove65 = isAbove65(dob);

    TimeLeft _timeLeft = TimeLeft(0, 0);

    if (!_isWeekendField) {
      if (works) {
        // _timeLeft = null;
        return true;
      }
    }

    if (_isUnder20) {
      DateTime now = DateTime.now();
      return _isBetweenFreehours(
          DateTime(now.year, now.month, now.day, _under20StartHour),
          DateTime(now.year, now.month, now.day, _under20EndHour));
    }

    if (_isAbove65) {
      DateTime now = DateTime.now();
      return _isBetweenFreehours(
          DateTime(now.year, now.month, now.day, _over65StartHour),
          DateTime(now.year, now.month, now.day, _over65EndHour));
    }

    if (_isWeekendField) {
      DateTime now = DateTime.now();
      return _isBetweenFreehours(
          DateTime(now.year, now.month, now.day, _weekendFreeStartHour),
          DateTime(now.year, now.month, now.day, _weekendFreeEndhour));
    } else {
      return true;
    }
  }

  bool _isBetweenFreehours(DateTime startTime, DateTime endTime) {
    DateTime now = DateTime.now();
    return (now.difference(startTime).inSeconds > 0 &&
        endTime.difference(now).inSeconds > 0);
  }

  TimeLeft getTimeLeft(DateTime time) {}

  // static Stream<TimeLeft> get timeLeft async* {
  //   TimeLeft timeLeft = TimeLeft(2,10);
  //   while () {
  //     await Future.delayed(Duration(seconds: 1), () {
  //       i++;
  //     });
  //     yield i;
  //   }
  // }
}

class TimeLeft {
  int hours;
  int minutes;

  TimeLeft(this.hours, this.minutes);
}
