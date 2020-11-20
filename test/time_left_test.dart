import 'package:flutter_test/flutter_test.dart';
import 'package:sokagacikmayasagi/models/time_left.dart';

void main() {
  test('totalMinutes270_returns4hours30mins', () {
    TimeLeft timeLeft = TimeLeft(270);
    expect(timeLeft.hours, 4);
    expect(timeLeft.minutes, 30);
  });

  test('totalMinutes240_returns4hours0mins', () {
    TimeLeft timeLeft = TimeLeft(240);
    expect(timeLeft.hours, 4);
    expect(timeLeft.minutes, 0);
  });
}
