import 'package:flutter_test/flutter_test.dart';
import 'package:age/age.dart';
import 'package:sokagacikmayasagi/models/person.dart';

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
    var isUnder20 = Person(dob: DateTime(2000, 10)).isUnder20();
    expect(isUnder20, true);
  });

  test('bornTheDayOn01012020Under20_returnsTrue', () {
    var isUnder20 = Person(dob: DateTime(2000)).isUnder20();
    expect(isUnder20, true);
  });

  test('bornBefore2020Under20_returnsFalse', () {
    var isUnder20 = Person(dob: DateTime(1999, 12, 31)).isUnder20();
    expect(isUnder20, false);
  });

  test('bornOn1955_isAbove65_returnsTrue', () {
    var res = Person(dob: DateTime(1955, 11, 17)).isAbove65();
    expect(res, true);
  });

  test('isAbove65_returnsFalse', () {
    var res = Person(dob: DateTime(1955, 12, 31)).isAbove65();
    expect(res, false);
  });
}
