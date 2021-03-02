import 'package:e_commerce/widgets/authButton.dart';
import 'package:e_commerce/widgets/authTextField.dart';
import 'package:e_commerce/widgets/authForm.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe7f6fe),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MediaQuery.of(context).size.height > 650
                    ? Hero(
                        tag: 'icon',
                        child: Container(
                          height: MediaQuery.of(context).size.height - 590,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/shop-2.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Color(0xFF0C1029)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height > 650
                      ? 20
                      : MediaQuery.of(context).size.height - 570,
                ),
                AuthForm(
                  isSignIn: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
