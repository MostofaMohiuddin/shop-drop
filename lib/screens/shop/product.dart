import 'package:e_commerce/models/Product.dart';
import 'package:e_commerce/widgets/authButton.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool _toggle = false;
  String _selectedSize = 'M';
  @override
  Widget build(BuildContext context) {
    var arg = [];
    arg = ModalRoute.of(context).settings.arguments;
    final Product product = arg[0];
    final isRecom = arg[1];
    return Scaffold(
      backgroundColor: Color(0xFFe7f6fe),
      body: SafeArea(
        child: Stack(
          children: [
            buildTopSheet(context, product, isRecom),
            buildBottomSheet(context, product),
            buildCartButton(context)
          ],
        ),
      ),
    );
  }

  Container buildCartButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.15),
      child: Center(
          child: AuthButton(
        color: 0xFF0C1029,
        onPress: () {},
        text: 'Add to Cart',
        textColor: 0xFFFFFFFF,
      )),
    );
  }

  GestureDetector buildTopSheet(
      BuildContext context, Product product, bool isRecom) {
    return GestureDetector(
      onTap: () {
        if (_toggle)
          setState(() {
            _toggle = false;
          });
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 300,
            padding: EdgeInsets.only(top: 20),
            // decoration: BoxDecoration(
            //   color: Colors.grey[350],
            //   image: DecorationImage(
            //     image: AssetImage(product.image),
            //     fit: BoxFit.contain,
            //   ),
            // ),
            child: Hero(
              child: Image.network(product.image),
              tag: isRecom
                  ? 'recomproduct' + product.id.toString()
                  : 'product' + product.id.toString(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 7),
                child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    iconSize: 34,
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, right: 10),
                child: IconButton(
                    icon: Icon(Icons.shopping_cart_rounded),
                    iconSize: 34,
                    onPressed: () {
                      print("hello");
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector buildBottomSheet(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _toggle = !_toggle;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        margin: EdgeInsets.only(
          top: _toggle
              ? MediaQuery.of(context).size.height - 450
              : MediaQuery.of(context).size.height - 300,
        ),
        height: _toggle ? 500 / 1.1 : 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: buildPrimaryProductData(product),
          ),
        ),
      ),
    );
  }

  Column buildPrimaryProductData(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[400],
            ),
            width: 90,
            height: 5,
            margin: EdgeInsets.only(bottom: 10),
          ),
        ),
        Text(
          product.title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "\$" + product.price.toString(),
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8C8C8C),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Your Size',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            buildSizeButton('S'),
            buildSizeButton('M'),
            buildSizeButton('L'),
            buildSizeButton('XL'),
          ],
        ),
        _toggle
            ? Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  Container buildSizeButton(size) {
    return Container(
      width: 40,
      margin: EdgeInsets.only(right: 10),
      child: RaisedButton(
        color: _selectedSize == size ? Colors.pink[50] : Colors.white70,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        onPressed: () {
          setState(() {
            _selectedSize = size;
          });
        },
        child: Text(
          size,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Column(
//   children: [
//     Center(
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(50),
//           color: Colors.grey[400],
//         ),
//         width: 90,
//         height: 5,
//         margin: EdgeInsets.only(bottom: 10),
//       ),
//     ),
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         buildPrimaryProductData(),
//         Column(
//           children: [
//             buildColorButton(),
//           ],
//         ),
//       ],
//     ),
//   ],
// ),

// Container buildColorButton() {
//   return Container(
//     width: 28,
//     height: 28,
//     padding: EdgeInsets.all(2),
//     decoration: BoxDecoration(
//       border: Border.all(width: 2, color: Colors.red),
//       borderRadius: BorderRadius.circular(50),
//     ),
//     child: RaisedButton(
//       onPressed: () {},
//       color: Colors.red,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(50.0),
//       ),
//     ),
//   );
// }
