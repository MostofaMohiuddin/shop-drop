import 'package:e_commerce/screens/auth/signin.dart';
import 'package:e_commerce/screens/auth/signup.dart';
import 'package:e_commerce/screens/home.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Fire.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: MaterialApp(
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
        home: MyHomePage(),
        routes: {
          '/signin': (context) => SignIn(),
          '/signup': (context) => SignUp(),
        },
      ),
    );
  }
}
