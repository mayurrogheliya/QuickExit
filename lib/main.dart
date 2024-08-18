import 'package:flutter/material.dart';
import 'package:quick_exit/screens/gate_pass_request.dart';
import 'package:quick_exit/screens/guard_login_screen.dart';
import 'package:quick_exit/screens/splash_screen.dart';
import 'package:quick_exit/screens/student_login_screen.dart';

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
