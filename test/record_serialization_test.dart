import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sokagacikmayasagi/record.dart';

void main() {
  test('toJson', () {
    final json = Record(DateTime(2000), false).toJson();

    String jsonEncoded = jsonEncode(json);

    print("==============================");
    print(jsonEncoded);

    Record rec = Record.fromJson(jsonDecode(jsonEncoded));

    print(rec.dob.toIso8601String());
    print(rec.age.toString());
    print(rec.dob.year.toString());
    print("------------------------------");

    List<Record> recs = [
      Record(DateTime(1990), false),
      Record(DateTime(1970), false)
    ];

    final listJson = jsonEncode(recs);
    print(listJson);

    List<Record> recsReturned =
        List<Record>.from(jsonDecode(listJson).map((r) => Record.fromJson(r)));
    print(recsReturned);
  });
}
