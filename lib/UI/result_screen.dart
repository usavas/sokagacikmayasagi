import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sokagacikmayasagi/UI/result_negative_screen.dart';
import 'package:sokagacikmayasagi/UI/result_positive_screen.dart';
import 'package:sokagacikmayasagi/services/curfew_provider.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: SafeArea(
        child: Consumer<CurfewProvider>(builder: (context, value, child) {
      return ResultPositiveScreen();
      // if (value.canGoOut) {
      //   return ResultPositiveScreen();
      // } else {
      //   return ResultNegativeScreen();
      // }
    }))));
  }
}
