import 'package:sokagacikmayasagi/models/person.dart';
import 'package:sokagacikmayasagi/models/time_left.dart';

abstract class CurfewServiceInterface {
  bool canGoOut(Person p);
  TimeLeft getTimeLeft(Person p);
}
