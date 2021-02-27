import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  String text;
  int color, textColor;
  var onPress;

  AuthButton({this.text, this.onPress, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 3, vertical: 15),
      textColor: Color(this.textColor),
      color: Color(this.color),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
        // side: BorderSide(color: Colors.amber),
      ),
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 17,
        ),
      ),
      onPressed: onPress,
    );
  }
}
