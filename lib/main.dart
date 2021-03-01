import 'package:e_commerce/screens/auth/authHome.dart';
import 'package:e_commerce/screens/auth/signin.dart';
import 'package:e_commerce/screens/auth/signup.dart';
import 'package:e_commerce/screens/home.dart';
import 'package:e_commerce/screens/shop/product.dart';
import 'package:e_commerce/screens/shop/shopHome.dart';
import 'package:e_commerce/screens/user/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = null;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop Me',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // pageTransitionsTheme: PageTransitionsTheme(
          //   builders: {
          //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          //   },
          // ),
          fontFamily: 'PT sans',
        ),
        home: FutureBuilder(
          future: _firebaseApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something Went Wrong");
            } else if (snapshot.hasData) {
              auth = FirebaseAuth.instance;
              return MyHomePage();
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        routes: {
          '/home': (context) {
            if (auth != null && auth.currentUser == null)
              return AuthHome();
            else
              return ShopHome();
          },
          '/signin': (context) => SignIn(),
          '/signup': (context) => SignUp(),
          '/product': (context) => ProductScreen(),
          '/profile': (context) => Profile()
        },
      ),
    );
  }
}
