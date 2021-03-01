import 'package:e_commerce/widgets/authButton.dart';
import 'package:flutter/material.dart';

class AuthHome extends StatefulWidget {
  @override
  _AuthHomeState createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  @override
  Widget build(BuildContext context) {
    const image = 'assets/images/shop.svg';

    return Scaffold(
      backgroundColor: Color(0xFFe7f6fe),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/shop.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),#9DEBF5

        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 10, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'icon',
              child: Container(
                height: MediaQuery.of(context).size.height / 2.2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/shop-2.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 16,
            ),
            Text(
              "SHOP ME",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                color: Color(0xFF0C1029),
              ),
            ),
            Text(
              "Leading Online Shoping App in Bangladesh",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                letterSpacing: 1,
                color: Color(0xFF0C1029),
              ),
            ),

            SizedBox(
              height: 35,
            ),
            Center(
              child: AuthButton(
                onPress: () {
                  Navigator.pushNamed(context, '/signin');
                },
                text: "Sign In",
                color: 0xFF0C1029,
                textColor: 0xFFFFFFFF,
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height / 2,
            // ),
            SizedBox(
              height: 13,
            ),
            Center(
              child: AuthButton(
                onPress: () {
                  Navigator.pushNamed(context, '/signup');
                },
                text: "Sign Up",
                color: 0xFFFFFFFF,
                textColor: 0xFF0C1029,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
