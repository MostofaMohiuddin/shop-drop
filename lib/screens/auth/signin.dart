import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Hello",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      body: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 8, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "HELLO",
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold, letterSpacing: 3),
            ),
            Text(
              "lorem ipsum dollor",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 2),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.3,
            ),
            Center(
              child: RaisedButton(
                onPressed: () {},
                child: Text("Sign In"),
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height / 2,
            // ),
            Center(
              child: RaisedButton(
                onPressed: () {},
                child: Text("Sign In"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
