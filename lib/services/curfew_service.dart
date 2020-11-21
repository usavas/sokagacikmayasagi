import 'package:sokagacikmayasagi/models/person.dart';
import 'package:sokagacikmayasagi/models/time_left.dart';
import 'package:sokagacikmayasagi/services/curfew_service_interface.dart';

class CurfewService implements CurfewServiceInterface {
  CurfewService._();

  static CurfewService _instance;

  static CurfewService get getInstance {
    return _instance = _instance ?? CurfewService._();
  }

  static setInstanceNull() {
    _instance = null;
  }

  bool _isWeekend(DateTime date) {
    return (date.weekday == DateTime.saturday ||
        date.weekday == DateTime.sunday);
  }

  static const int _weekendFreeStartHour = 10;
  static const int _weekendFreeEndhour = 20;

  static const int _over65StartHour = 10;
  static const int _over65EndHour = 13;

  static const int _under20StartHour = 13;
  static const int _under20EndHour = 16;

  bool canGoOut(Person person) {
    DateTime now = DateTime.now();
    bool _isWeekendField = _isWeekend(now);

    if (!_isWeekendField) {
      if (person.works) {
        return true;
      }
    }

    if (person.isUnder20()) {
      DateTime now = DateTime.now();
      bool isFree = _isBetweenFreehours(
          DateTime(now.year, now.month, now.day, _under20StartHour),
          DateTime(now.year, now.month, now.day, _under20EndHour));
      return isFree;
    }

    if (person.isAbove65()) {
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

  TimeLeft getTimeLeft(Person person) {
    bool _isWeekendField = _isWeekend(DateTime.now());

    if (!_isWeekendField) {
      if (person.works) {
        return null;
      }
    }

    if (person.isUnder20()) {
      DateTime now = DateTime.now();
      if (_isBetweenFreehours(
          DateTime(now.year, now.month, now.day, _under20StartHour),
          DateTime(now.year, now.month, now.day, _under20EndHour))) {
        return TimeLeft(DateTime(now.year, now.month, now.day, _under20EndHour)
            .difference(now)
            .inMinutes);
      } else {
        return null;
      }
    }

    if (person.isAbove65()) {
      DateTime now = DateTime.now();
      if (_isBetweenFreehours(
          DateTime(now.year, now.month, now.day, _over65StartHour),
          DateTime(now.year, now.month, now.day, _over65EndHour))) {
        TimeLeft timeLef = TimeLeft(DateTime(now.year, now.month, now.day, 14)
            .difference(now)
            .inMinutes);
        return timeLef;
      } else {
        return null;
      }
    }

    if (_isWeekendField) {
      DateTime now = DateTime.now();
      if (_isBetweenFreehours(
          DateTime(now.year, now.month, now.day, _weekendFreeStartHour),
          DateTime(now.year, now.month, now.day, _weekendFreeEndhour))) {
        return TimeLeft(
            DateTime(now.year, now.month, now.day, _weekendFreeEndhour)
                .difference(now)
                .inMinutes);
      }
    } else {
      return null;
    }

    return null;
  }

  bool _isBetweenFreehours(DateTime startTime, DateTime endTime) {
    DateTime now = DateTime.now();
    return (now.difference(startTime).inSeconds > 0 &&
        endTime.difference(now).inSeconds > 0);
  }
}
