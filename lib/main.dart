import 'package:flutter/material.dart';
import 'package:quick_exit/screens/Guard_Screens/IssueGatepass.dart';
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
        '/Guard_Screens': (context) => Issuegatepass(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 43, 44, 66)),
      ),
    );
  }
}
