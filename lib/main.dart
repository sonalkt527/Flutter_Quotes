import 'package:daily_quotes/Home_page.dart';
import 'package:daily_quotes/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:daily_quotes/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:daily_quotes/Signup.dart';

void main() async {
 await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform
);

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        routes: {
          '/second': (context) => Signup(),
          '/first': (context) => LoginPage(),
          '/third':(context)=>Home_page()
        }
      );
  }
}
