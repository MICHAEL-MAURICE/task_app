import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskapp/config/config.dart';
import 'package:taskapp/screens/home_screen.dart';
import 'package:taskapp/screens/login_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme:
          ThemeData(primaryColor: primaryColor, brightness: Brightness.light),
      darkTheme:
          ThemeData(brightness: Brightness.dark, primaryColor: primaryColor),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _auth.onAuthStateChanged,
      builder: (ctx, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasData) {
          FirebaseUser user = snapshot.data;

          if (user != null) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        }

        return LoginScreen();
      },
    );
  }
}
