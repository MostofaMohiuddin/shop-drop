import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/Category.dart';
import 'package:e_commerce/models/Product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopHome extends StatefulWidget {
  @override
  _ShopHomeState createState() => _ShopHomeState();
  ShopHome() {}
}

class _ShopHomeState extends State<ShopHome> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  List<Product> productList = [];
  List<Product> recomProductList = [];

  String _selectedId = "Men";
  @override
  Widget build(BuildContext context) {
    if (productList.length == 0) _products("Men");
    // if (recomProductList.length == 0) _recomendedProducts();

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
                  children: categoriesString.map((element) {
                    return buildCategoryItem(element);
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: MediaQuery.of(context).size.height / 3,
                child: productList.length == 0
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(
                        scrollDirection: Axis.horizontal,
                        children: productList.map((e) {
                          if (e.category == _selectedId)
                            return buildProductItem(context, e, false);
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
                child: recomProductList.length == 0
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(
                        scrollDirection: Axis.horizontal,
                        children: recomProductList.map((e) {
                          return buildProductItem(context, e, true);
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
              backgroundImage: NetworkImage(auth.currentUser.photoURL),
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

  GestureDetector buildProductItem(
      BuildContext context, Product item, bool isRecom) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: [item, isRecom],
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
                  child: Image.network(item.image),
                  tag:
                      isRecom ? 'recomproduct' + item.id : 'product' + item.id),
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

  _recomendedProducts() async {
    List<Product> tempRecomList = [];
    await firestoreInstance
        .collection("recomendedProducts")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((ref) {
        ref.data()["ref"].get().then((result) {
          print("My dAta: ");
          print(
              result.data()["price"].toString() + " " + result.data()["title"]);

          tempRecomList.add(
            new Product(
                category: result.data()["category"],
                description: result.data()["description"],
                id: result.id,
                image: result.data()["image"],
                price: result.data()["price"],
                title: result.data()["title"]),
          );
          setState(() {
            recomProductList = [...tempRecomList];
          });
        });
      });
    });

    // QuerySnapshot querySnapshot =
    //     await firestoreInstance.collection("recomendedProducts").get();
    // querySnapshot.docs.forEach((ref) {
    //   ref
    // });

    // tempList.forEach((element) {
    //   print("My Item" + element.title);
    // });
  }

  _products(item) async {
    List<Product> tempList = [];
    await firestoreInstance.collection("products").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        // print(result.data());
        // if(result)
        tempList.add(new Product(
            category: result.data()["category"],
            description: result.data()["description"],
            id: result.id,
            image: result.data()["image"],
            price: result.data()["price"],
            title: result.data()["title"]));
      });
    });
    setState(() {
      productList.clear();
      productList = [...tempList];
    });

    // print(productList);
  }

  GestureDetector buildCategoryItem(String item) {
    return GestureDetector(
      onTap: () {
        // print(item.id);
        setState(() {
          _selectedId = item;
        });
        _recomendedProducts();
        // _products(item);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color:
              this._selectedId == item ? Color(0xFF0C1029) : Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(horizontal: 25),
        margin: EdgeInsets.only(right: 0),
        child: Center(
          child: Text(
            item,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color:
                  this._selectedId == item ? Colors.white : Color(0xFF0C1029),
            ),
          ),
        ),
      ),
    );
  }
}
