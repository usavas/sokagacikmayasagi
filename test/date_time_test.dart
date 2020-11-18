import 'package:flutter_test/flutter_test.dart';

void main() {
  test('timeDifference_test', () {
    DateTime time = DateTime(2020, 10, 10, 10);

    var mins = time
        .difference(DateTime(time.year, time.month, time.day, 12))
        .inMinutes;
    print(mins.toString());

    var minsReverse = DateTime(time.year, time.month, time.day, 12)
        .difference(time)
        .inMinutes;
    print(minsReverse.toString());
  });
}
