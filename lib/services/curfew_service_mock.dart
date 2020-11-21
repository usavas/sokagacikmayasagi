import 'package:sokagacikmayasagi/models/time_left.dart';
import 'package:sokagacikmayasagi/models/person.dart';
import 'package:sokagacikmayasagi/services/curfew_service_interface.dart';

class CurfewServiceMock implements CurfewServiceInterface {
  static CurfewServiceMock get getInstance => CurfewServiceMock();

  @override
  bool canGoOut(Person p) {
    return true;
  }

  @override
  TimeLeft getTimeLeft(Person p) {
    return TimeLeft(100);
  }
}
