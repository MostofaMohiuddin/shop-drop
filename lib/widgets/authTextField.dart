import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  String hint;
  AuthTextField({Key key, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        alignLabelWithHint: true,
        // labelText: "hint",
        filled: true,
        fillColor: Color(0xFFEAEDF4),
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        focusedBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.transparent),
          borderRadius: new BorderRadius.circular(50),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: new BorderSide(color: Colors.transparent),
          borderRadius: new BorderRadius.circular(50),
        ),
      ),
    );
  }
}
