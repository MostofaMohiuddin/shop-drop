import 'package:e_commerce/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  bool loading = false;

  _showSnackbar(error) {
    return SnackBar(
      content: Text(error),
    );
  }

  signIn(context) async {
    if (_formKey.currentState.validate()) {
      try {
        await auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          setState(() {
            loading = false;
          });
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/home', (Route<dynamic> route) => false);
        });

        print(email + " " + password);
      } catch (error) {
        print("my error: " + error.message);
        Scaffold.of(context).showSnackBar(_showSnackbar(error.message));
        setState(() {
          loading = false;
        });
      }
    } else
      setState(() {
        loading = false;
      });
  }

  signUp(context) async {
    // AuthenticationService _authenticationService =
    //     new AuthenticationService(auth);
    if (_formKey.currentState.validate()) {
      try {
        await auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          var user = auth.currentUser;

          user
              .updateProfile(
                  displayName: username,
                  photoURL: "https://ui-avatars.com/api/?size=200&name=" +
                      username.replaceAll(" ", "+"))
              .then((value) {
            setState(() {
              loading = false;
            });
            final firestoreInstance = FirebaseFirestore.instance;
            firestoreInstance.collection("users").doc(user.uid).set({
              "email": user.email,
              "username": username,
            }).then((value) {});
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/home', (Route<dynamic> route) => false);
          });
        });
      } catch (error) {
        print("my error: " + error.message);
        Scaffold.of(context).showSnackBar(_showSnackbar(error.message));
        setState(() {
          loading = false;
        });
      }
    } else
      setState(() {
        loading = false;
      });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
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
            height: 500,
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
                            height: 20,
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
                  height: 20,
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
                  onPress: loading
                      ? null
                      : () {
                          //TODO: sign in/sign up
                          setState(() {
                            loading = true;
                          });

                          this.widget.isSignIn
                              ? signIn(context)
                              : signUp(context);
                        },
                  text: loading
                      ? 'Loading'
                      : this.widget.isSignIn
                          ? "Sign In"
                          : "Sign Up",
                  color: 0xFF0C1029,
                  textColor: 0xFFFFFFFF,
                ),
                SizedBox(
                  height: 20,
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
      ),
    );
  }
}
