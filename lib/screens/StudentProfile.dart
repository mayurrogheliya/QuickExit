import 'package:flutter/material.dart';
import 'package:quick_exit/firebase/FirebaseOperations.dart';
import 'package:quick_exit/screens/ProfileField.dart';
import 'package:quick_exit/screens/StudentLogin.dart'; 
import 'package:shared_preferences/shared_preferences.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  Map<String, dynamic>? studentData;
  final FirebaseOperations _firebaseOperations = FirebaseOperations();

  @override
  void initState() {
    super.initState();
    _fetchStudentData();
  }

  // Fetch student data using the enrollment number stored in SharedPreferences
  Future<void> _fetchStudentData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? enNum = prefs.getString('enNum');

    if (enNum != null) {
      var data = await _firebaseOperations.getStudentData(enNum);
      setState(() {
        studentData = data; // Save student data for rendering
      });
    }
  }

  // Method to handle sign-out and navigate to the login page
  Future<void> _signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all stored data in SharedPreferences

    // Navigate back to the StudentLogin screen after signing out
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => StudentLogin()),
      (Route<dynamic> route) => false, // This clears the back stack
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFFEDF2F4),
          ),
          child: studentData == null
              ? Center(
                  child: CircularProgressIndicator(),
                ) // Show loading spinner while fetching data
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User Information UI
                    Container(
                      height: height * 0.19,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Image.asset(
                                "./assets/images/user.png",
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Hello ${studentData?['FNAME'] ?? 'N/A'}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    letterSpacing: 1,
                                  ),
                                ),
                                Text(
                                  "${studentData?['PROGRAM']}, Sem-${studentData?['SEM']}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15,
                                    letterSpacing: 1,
                                  ),
                                ),
                                Text(
                                  "${studentData?['EN_NUM'] ?? 'N/A'}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    // Student details fetched from Firebase
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProfileField(
                                  label: "First Name",
                                  value: studentData?['FNAME'] ?? 'N/A',
                                ),
                                SizedBox(height: 12),
                                ProfileField(
                                  label: "Last Name",
                                  value: studentData?['LNAME'] ?? 'N/A',
                                ),
                                SizedBox(height: 12),
                                ProfileField(
                                  label: "Enrollment Number",
                                  value: studentData?['EN_NUM'] ?? 'N/A',
                                ),
                                SizedBox(height: 12),
                                ProfileField(
                                  label: "Email",
                                  value: studentData?['EMAIL'] ?? 'N/A',
                                ),
                                SizedBox(height: 12),
                                ProfileField(
                                  label: "Phone",
                                  value: studentData?['PHONE'] ?? 'N/A',
                                ),
                                SizedBox(height: 12),
                                ProfileField(
                                  label: "Hostel Building Number",
                                  value: studentData?['BUILDING_NO'] ?? 'N/A',
                                ),
                                SizedBox(height: 12),
                                ProfileField(
                                  label: "Room Number",
                                  value: studentData?['ROOM_NO'] ?? 'N/A',
                                ),
                                SizedBox(height: 30),

                                // Sign-out button
                                Center(
                                  child: ElevatedButton(
                                    onPressed: _signOut,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFFF3B30),
                                      foregroundColor: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 15),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Text('Sign Out'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
