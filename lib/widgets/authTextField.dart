import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  String hint;
  var setField;
  bool isSignUp = false;
  AuthTextField({Key key, this.hint, this.setField, this.isSignUp = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (text) {
        setField(text);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        if (this.isSignUp && this.hint == 'Password' && value.length < 6)
          return 'Password too short';
        return null;
      },
      obscureText: this.hint == 'Password' ? true : false,
      enableSuggestions: this.hint == 'Password' ? false : true,
      autocorrect: this.hint == 'Password' ? false : true,
      obscuringCharacter: "*",
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
