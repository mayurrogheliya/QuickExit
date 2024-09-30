import 'package:flutter/material.dart';
import 'package:quick_exit/screens/StudentNavBar.dart';
import 'package:quick_exit/screens/WaveClipper.dart';
import 'package:quick_exit/screens/guard_login_screen.dart';

class StudentLogin extends StatefulWidget {
  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  final TextEditingController _enrollmentController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Ensures the screen resizes on keyboard pop-up
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Red container with wavy bottom edge and Welcome Text
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                width: double.infinity,
                height: 400,
                color: Color(0xFFFF3B30),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 75, left: 24.0, right: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to QuickExit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 21),
                      Text(
                        'Seamless and secure gate passes at your fingertips.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        'Login to Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Form Field Container with Form Fields
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Enrollment number input field
                  TextField(
                    controller: _enrollmentController,
                    decoration: InputDecoration(
                      labelText: 'Enrollment Number',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                  ),
                  SizedBox(height: 20),

                  //Password input field
                  TextField(
                    obscureText: isPasswordVisible,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  //Login Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentNavbar()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF3B30),
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text('Login'),
                  ),
                  SizedBox(height: 20),

                  //Employee Login Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GuardLogin()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 237, 242, 244),
                      foregroundColor: Color.fromARGB(255, 43, 44, 66),
                      padding:
                          EdgeInsets.symmetric(horizontal: 65, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text('Employee Login'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
