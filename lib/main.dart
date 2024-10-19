import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quick_exit/firebase_options.dart';
import 'package:quick_exit/screens/StudentLogin.dart';
import 'package:quick_exit/screens/splash_screen.dart';
// import 'package:quick_exit/screens/StudentLogin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 255, 255)),
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
