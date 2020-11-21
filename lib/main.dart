import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sokagacikmayasagi/UI/home_screen.dart';
import 'package:sokagacikmayasagi/UI/terms_conditions_screen.dart';
import 'package:sokagacikmayasagi/services/curfew_provider.dart';
import 'package:sokagacikmayasagi/services/shared_pref_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CurfewProvider>(
      create: (context) => CurfewProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dışarı Çıkabilir miyim?',
        theme: ThemeData(
          primaryColor: Colors.red[400],
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline5: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.normal),
            headline6: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.normal),
            bodyText1: TextStyle(color: Colors.black87, fontSize: 18),
            bodyText2: TextStyle(color: Colors.black87, fontSize: 16),
            button: TextStyle(color: Colors.black87, fontSize: 20),
          ),
        ),
        home: FutureBuilder(
            future: SharedPrefService.instance.getTermsConditionsRead(),
            builder: (context, snapshot) => snapshot.data ?? false
                ? HomeScreen()
                : TermsAndConditionsScreen()),
      ),
    );
  }
}
