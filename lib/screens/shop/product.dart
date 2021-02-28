import 'package:e_commerce/widgets/authButton.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool _toggle = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEAEDF4),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5 + 20,
            decoration: BoxDecoration(
              color: Color(0xFFEAEDF4),
              image: DecorationImage(
                image: AssetImage("assets/images/coat.jpg"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _toggle = !_toggle;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              // Provide an optional curve to make the animation feel smoother.
              curve: Curves.fastOutSlowIn,
              margin: EdgeInsets.only(
                top: _toggle
                    ? MediaQuery.of(context).size.height / 2
                    : MediaQuery.of(context).size.height / 1.5 - 20,
              ),
              height: _toggle
                  ? MediaQuery.of(context).size.height / 2
                  : MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.grey[350],
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black,
                        ),
                        width: 90,
                        height: 5,
                        margin: EdgeInsets.only(bottom: 10),
                      ),
                    ),
                    Text(
                      "Coat",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$80",
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
                    _toggle
                        ? Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.15),
            child: Center(
                child: AuthButton(
              color: 0xFF0C1029,
              onPress: () {},
              text: 'Add to Cart',
              textColor: 0xFFFFFFFF,
            )),
          )
        ],
      ),
    );
  }
}
