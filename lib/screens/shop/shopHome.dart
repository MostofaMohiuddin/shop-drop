import 'package:badges/badges.dart';
import 'package:e_commerce/models/Category.dart';
import 'package:e_commerce/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopHome extends StatefulWidget {
  @override
  _ShopHomeState createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHome> {
  int _selectedId = categories[0].id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe7f6fe),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTopBar(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 40.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: categories.map((element) {
                    return buildCategoryItem(element);
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: MediaQuery.of(context).size.height / 3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: products.map((e) {
                    if (e.category.id == _selectedId)
                      return buildProductItem(context, e);
                    else
                      return SizedBox();
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Recomended For You',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: MediaQuery.of(context).size.height / 3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: recomendedProducts.map((e) {
                    return buildProductItem(context, e);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildTopBar() {
    return Container(
      margin: EdgeInsets.only(
        top: 50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/coat_3.png',
              ),
              backgroundColor: Colors.grey[200],
            ),
          ),
          Badge(
            position: BadgePosition.topEnd(top: -5, end: -5),
            badgeContent: Text("10"),
            badgeColor: Color(0xFFEAEDF4),
            child: IconButton(
              icon: Icon(Icons.shopping_cart_rounded),
              color: Color(0xFF0C1029),
              iconSize: 35,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector buildProductItem(BuildContext context, Product item) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: item,
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[350],
              ),
              margin: EdgeInsets.only(right: 20),
              width: 160.0,
              child: Hero(
                  child: Image.asset(item.image),
                  tag: 'product' + item.id.toString()),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  width: 100,
                ),
                Container(
                  padding: EdgeInsets.only(right: 5),
                  child: Text(
                    "\$" + item.price.toString(),
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8C8C8C)),
                    textAlign: TextAlign.end,
                  ),
                  width: 60,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildCategoryItem(item) {
    return GestureDetector(
      onTap: () {
        print(item.id);
        setState(() {
          _selectedId = item.id;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: this._selectedId == item.id
              ? Color(0xFF0C1029)
              : Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(horizontal: 25),
        margin: EdgeInsets.only(right: 0),
        child: Center(
          child: Text(
            item.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: this._selectedId == item.id
                  ? Colors.white
                  : Color(0xFF0C1029),
            ),
          ),
        ),
      ),
    );
  }
}
