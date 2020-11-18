import 'package:flutter/material.dart';
import 'package:sokagacikmayasagi/consts.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kPageBgDecoration,
      child: Scaffold(
          body: SafeArea(
              child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/tebrikler.png',
              width: MediaQuery.of(context).size.width / 3 * 2,
            ),
          ],
        ),
      ))),
    );
  }
}
