import 'package:e_commerce/screens/auth/authHome.dart';
import 'package:e_commerce/screens/shop/product.dart';
import 'package:e_commerce/screens/shop/shopHome.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe7f6fe),
      body: ShopHome(),
    );
  }
}
