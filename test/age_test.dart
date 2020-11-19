import 'package:flutter_test/flutter_test.dart';
import 'package:age/age.dart';
import 'package:sokagacikmayasagi/curfew_service.dart';

void main() {
  test('age_ageEquals28', () {
    var age = Age.dateDifference(
        fromDate: DateTime(1992, 2, 7),
        toDate: DateTime(2020, 11, 18),
        includeToDate: false);
    expect(age.years, 28);
  });

  test('age_ageEquals29', () {
    var age = Age.dateDifference(
        fromDate: DateTime(1992, 2, 7),
        toDate: DateTime(2021, 2, 7),
        includeToDate: false);
    expect(age.years, 29);
  });

  test('bornAfter01012020_Under20_returnsTrue', () {
    var isUnder20 = CurfewService.getInstance.isUnder20(DateTime(2000, 10));
    expect(isUnder20, true);
  });

  test('bornTheDayOn01012020Under20_returnsTrue', () {
    var isUnder20 = CurfewService.getInstance.isUnder20(DateTime(2000));
    expect(isUnder20, true);
  });

  test('bornBefore2020Under20_returnsFalse', () {
    var isUnder20 = CurfewService.getInstance.isUnder20(DateTime(1999, 12, 31));
    expect(isUnder20, false);
  });
}
