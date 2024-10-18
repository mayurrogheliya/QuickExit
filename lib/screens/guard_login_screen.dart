import 'package:flutter/material.dart';
import 'package:quick_exit/screens/Guard_Screens/GuardNavBar.dart';
import 'package:quick_exit/screens/Rector_Screens/RectorNavBar.dart';
import 'package:quick_exit/screens/WaveClipper.dart';
import 'package:quick_exit/screens/StudentLogin.dart';
import 'package:quick_exit/firebase/FirebaseOperations.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import Firebase operations

class GuardLogin extends StatefulWidget {
  @override
  State<GuardLogin> createState() => _GuardLoginState();
}

class _GuardLoginState extends State<GuardLogin> {
  final TextEditingController _employeeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = true;
  final FirebaseOperations _firebaseOperations = FirebaseOperations();

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn(); // Check if user is already logged in
  }

  // Check if the user is already logged in
  Future<void> _checkIfLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? enNum = prefs.getString('empId');

    if (enNum != null) {
      // Redirect to StudentNavbar if already logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GuardNavBar()),
      );
    }
  }

  // Method to handle login
  Future<void> _handleLogin() async {
    String empId = _employeeController.text.trim();
    String password = _passwordController.text.trim();

    if (empId.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter Employee ID and Password')),
      );
      return;
    }

    var employee = await _firebaseOperations.loginEmployee(empId, password);
    if (employee != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('empId', empId);
      String role = employee['ROLE'];
      if (role == 'RECTOR') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RectorNavBar()),
        );
      } else if (role == 'GUARD') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GuardNavBar()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Unauthorized role')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid Employee ID or Password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Change here to fit content
                children: [
                  // Employee ID input field
                  TextField(
                    controller: _employeeController,
                    decoration: InputDecoration(
                      labelText: 'Employee ID',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Password input field
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

                  // Login Button
                  ElevatedButton(
                    onPressed: _handleLogin, // Call login function
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

                  // Student Login Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StudentLogin()),
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
                    child: Text('Student Login'),
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
