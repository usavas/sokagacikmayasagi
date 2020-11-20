import 'package:flutter/material.dart';
import 'package:sokagacikmayasagi/UI/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sokaga Cikma Yasagi',
      theme: ThemeData(
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
      home: HomeScreen(),
    );
  }
}
