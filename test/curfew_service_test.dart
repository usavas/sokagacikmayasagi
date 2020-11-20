import 'package:flutter_test/flutter_test.dart';
import 'package:sokagacikmayasagi/models/person.dart';
import 'package:sokagacikmayasagi/services/curfew_service.dart';

void main() {
  test('above65CanGoOutAt??_returnsFalse', () {
    bool canGoOut = CurfewService.getInstance
        .canGoOut(Person(dob: DateTime(1950), works: false));
    print(canGoOut);
    expect(canGoOut, false);
  });

  test('usualPeopleCanGoOutAt??_returnsTrue', () {
    bool canGoOut = CurfewService.getInstance
        .canGoOut(Person(dob: DateTime(1992), works: false));
    print(canGoOut);
    expect(canGoOut, true);
  });
}
