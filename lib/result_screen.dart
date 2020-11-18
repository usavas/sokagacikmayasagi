import 'package:flutter/material.dart';
import 'package:sokagacikmayasagi/buttons.dart';
import 'package:sokagacikmayasagi/consts.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

String _isAlowed() {}

String _getTimeLeftinfo() {
  return 'Kalan sure';
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: Container(
        // decoration: kPageBgDecoration,
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/tebrikler.png',
                width: MediaQuery.of(context).size.width / 3 * 2,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Eve donmen icin kalan sure:',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                height: 12,
              ),
              Text(_getTimeLeftinfo(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.w700)),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: WideButton(
                  buttonText: 'Yenile',
                  icon: Icon(Icons.refresh),
                  onPressedFunction: () {},
                ),
              )
            ],
          ),
        )),
      )),
    );
  }
}
