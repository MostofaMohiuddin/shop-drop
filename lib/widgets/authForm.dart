import 'package:e_commerce/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'authButton.dart';
import 'authTextField.dart';

class AuthForm extends StatefulWidget {
  bool isSignIn;

  AuthForm({
    Key key,
    this.isSignIn,
  }) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  String username = "", email = "", password = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  signIn(context) {
    if (auth.currentUser == null) {
      print('User is currently signed out!');
      final snackBar = SnackBar(
        content: Text('User is currently signed out!'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    } else {
      print('User is signed in!');
      final snackBar = SnackBar(
        content: Text('User is signed in!'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      return;
    }

    if (_formKey.currentState.validate()) {
      new AuthenticationService(auth).signIn(email: email, password: password);
      print(email + " " + password);
    }
  }

  signUp() async {
    // AuthenticationService _authenticationService =
    //     new AuthenticationService(auth);
    if (_formKey.currentState.validate()) {
      if (auth.currentUser == null) {
        print('User is currently signed out!');
        final snackBar = SnackBar(
          content: Text('User is currently signed out!'),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      } else {
        print('User is signed in!');
        final snackBar = SnackBar(
          content: Text('User is signed in!'),
        );
        Scaffold.of(context).showSnackBar(snackBar);
        // _authenticationService.signOut();
      }
      String result = await new AuthenticationService(auth)
          .signUp(email: email, password: password);
      print(email + " " + password + " " + result);
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
          padding: EdgeInsets.only(
            top: 50,
            left: 20,
            right: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height / 1.625,
          child: Column(
            children: [
              this.widget.isSignIn
                  ? SizedBox()
                  : Column(
                      children: [
                        AuthTextField(
                          hint: 'Username',
                          setField: (value) {
                            setState(() {
                              username = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                      ],
                    ),
              AuthTextField(
                hint: 'Email',
                setField: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              AuthTextField(
                hint: 'Password',
                setField: (value) {
                  setState(() {
                    password = value;
                  });
                },
                isSignUp: !this.widget.isSignIn,
              ),
              SizedBox(
                height: 35,
              ),
              AuthButton(
                onPress: () {
                  //TODO: sign in/sign up
                  this.widget.isSignIn ? signIn(context) : signUp();
                },
                text: this.widget.isSignIn ? "Sign In" : "Sign Up",
                color: 0xFF0C1029,
                textColor: 0xFFFFFFFF,
              ),
              SizedBox(
                height: this.widget.isSignIn
                    ? MediaQuery.of(context).size.height / 20
                    : MediaQuery.of(context).size.height / 180,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(
                      context, this.widget.isSignIn ? '/signup' : '/signin');
                },
                child: Text(
                  this.widget.isSignIn
                      ? "Don't have an account? Sign Up"
                      : "Already have an account? Sign In",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
