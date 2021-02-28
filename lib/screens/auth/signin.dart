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
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: 'icon',
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/shop-2.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
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
                height: MediaQuery.of(context).size.height / 40,
              ),
              AuthForm(
                isSignIn: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
