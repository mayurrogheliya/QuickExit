import 'package:flutter/material.dart';
import 'package:quick_exit/screens/Guard_Screens/GuardNavBar.dart';
import 'package:quick_exit/screens/Guard_Screens/IssueGatePass.dart';
import 'package:quick_exit/screens/StudentLogin.dart';
import 'package:quick_exit/screens/StudentNavBar.dart';
import 'package:quick_exit/screens/splash_screen.dart';
// import 'package:quick_exit/screens/StudentLogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SplashScreen(),
        '/loginscreen': (context) => StudentLogin(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 43, 44, 66)),
      ),
    );
  }
}
