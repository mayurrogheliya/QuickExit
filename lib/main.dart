import 'package:flutter/material.dart';
import 'package:quick_exit/screens/student_login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentLogin(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        // inputDecorationTheme: InputDecorationTheme(
        //   enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(2),
        //     ),
        //     borderSide: BorderSide(
        //       color: Colors.grey,
        //       width: 1.0,
        //     ),
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(2),
        //     ),
        //     borderSide: BorderSide(
        //       color: Colors.,
        //       width: 2.0,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
