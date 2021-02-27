import 'package:flutter/material.dart';

import 'authButton.dart';
import 'authTextField.dart';

class AuthForm extends StatelessWidget {
  bool isSignIn;
  AuthForm({Key key, this.isSignIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          top: 50,
          left: MediaQuery.of(context).size.width / 10,
          right: MediaQuery.of(context).size.width / 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height / 1.76,
        child: Column(
          children: [
            this.isSignIn
                ? SizedBox()
                : Column(
                    children: [
                      AuthTextField(
                        hint: 'Username',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
            AuthTextField(
              hint: 'Email',
            ),
            SizedBox(
              height: 20,
            ),
            AuthTextField(
              hint: 'Password',
            ),
            SizedBox(
              height: 35,
            ),
            AuthButton(
              onPress: () {
                Navigator.pushNamed(context, '/signin');
              },
              text: "Sign In",
              color: 0xFF0C1029,
              textColor: 0xFFFFFFFF,
            ),
            SizedBox(
              height: this.isSignIn ? 70 : 20,
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(
                    context, this.isSignIn ? '/signup' : '/signin');
              },
              child: Text(
                this.isSignIn
                    ? "Don't have an account? Sign Up"
                    : "Already have an account? Sign In",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }
}
