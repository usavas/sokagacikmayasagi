import 'package:flutter_test/flutter_test.dart';
import 'package:age/age.dart';

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
}
