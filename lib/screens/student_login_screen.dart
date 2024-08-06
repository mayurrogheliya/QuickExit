import 'package:flutter/material.dart';
import 'package:quick_exit/screens/admin_login_screen.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({super.key});

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  TextEditingController enrollmentController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String enrollmentError = "";
  String passwordError = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: enrollmentController,
              decoration: InputDecoration(
                  hintText: "Enrollment Number",
                  labelText: "Enrollment Number",
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(2),
                    ),
                    borderSide: BorderSide(
                        color: enrollmentController.text.isEmpty
                            ? Colors.red
                            : Colors.transparent),
                  )),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                enrollmentError,
                style: TextStyle(color: Colors.red),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Password",
                prefixIcon: Icon(
                  Icons.lock,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(2),
                  ),
                  borderSide: BorderSide(
                    color: passwordController.text.isEmpty
                        ? Colors.red
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                passwordError,
                style: TextStyle(color: Colors.red),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (enrollmentController.text.isEmpty) {
                    enrollmentError = "Enrollment Number is required";
                    borderSide: BorderSide(
                    color: Colors.red
                    width: 2,
                  );
                  } else {
                    enrollmentError = "";
                    borderSide: BorderSide(
                    color: Colors.transparent
                    width: 2,),
                  }
                  if (passwordController.text.isEmpty) {
                    passwordError = "Password is required";
                    borderSide: BorderSide(
                    color: Colors.red
                    width: 2,);
                  } else {
                    passwordError = "";
                    borderSide: BorderSide(
                    color: Colors.transparent
                    width: 2,);
                  }
                });
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminLogin(),
                    ),
                  );
                });
              },
              child: Text(
                "Employee Login",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
