import 'package:flutter_test/flutter_test.dart';
import 'package:sokagacikmayasagi/curfew_service.dart';

void main() {
  test('isAbove65_returnsTrue', () {
    var res = CurfewService.getInstance.isAbove65(DateTime(1955, 11, 17));
    expect(res, true);
  });

  test('isAbove65_returnsFalse', () {
    var res = CurfewService.getInstance.isAbove65(DateTime(1955, 12, 31));
    expect(res, false);
  });

  test('above65CanGoOutAt??_returnsFalse', () {
    bool canGoOut = CurfewService.getInstance.canGoOut(DateTime(1950), false);
    print(canGoOut);
    expect(canGoOut, false);
  });

  test('usualPeopleCanGoOutAt??_returnsTrue', () {
    bool canGoOut = CurfewService.getInstance.canGoOut(DateTime(1992), false);
    print(canGoOut);
    expect(canGoOut, true);
  });
}
