import 'package:flutter/material.dart';
import '../consts.dart';

class WideButton extends StatelessWidget {
  const WideButton(
      {Key key,
      this.buttonText,
      this.onPressedFunction,
      this.backgroundColor,
      this.icon,
      this.textColor})
      : super(key: key);

  final String buttonText;
  final Function onPressedFunction;
  final Color backgroundColor;
  final Icon icon;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    Color backColor = backgroundColor ?? kWidgetBgColor;
    return Container(
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          color: backColor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          onPressed: onPressedFunction,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (icon != null) ? icon : SizedBox(),
              SizedBox(
                width: 12,
              ),
              Text(
                buttonText,
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: textColor),
              ),
            ],
          ),
          elevation: 20,
        ),
      ),
    );
  }
}
