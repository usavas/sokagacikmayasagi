import 'package:flutter/material.dart';

class SimpleAlertDialog extends StatelessWidget {
  const SimpleAlertDialog(
      {Key key, this.title, this.content, this.cancelButtonText})
      : super(key: key);

  final String title;
  final String content;
  final String cancelButtonText;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: AlertDialog(
      content: Text(
        content,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      actions: [
        FlatButton(
          child: Text(cancelButtonText),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    ));
  }
}
