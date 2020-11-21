import 'package:flutter/material.dart';

class PreviousQueries extends StatefulWidget {
  PreviousQueries({Key key}) : super(key: key);

  @override
  _PreviousQueriesState createState() => _PreviousQueriesState();
}

class _PreviousQueriesState extends State<PreviousQueries> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
            child: Center(
          child: Column(
            children: [Text('previous queries')],
          ),
        )),
      ),
    );
  }
}
