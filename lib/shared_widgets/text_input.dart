import 'package:flutter/material.dart';

import '../consts.dart';

class TextInput extends StatelessWidget {
  const TextInput(this.hintText, this.controller, this.validator,
      {Key key, this.isPasswd = false})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final Function validator;
  final bool isPasswd;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kWidgetInnerPadding),
        width: double.infinity,
        decoration: kInputFieldBgDecoration,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
          ),
          validator: validator,
          obscureText: isPasswd,
        ),
      ),
    );
  }
}
