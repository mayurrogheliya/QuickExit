import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseOperations {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> loginUser(String enNum, String password) async {
    try {
      // Fetch the user with the provided enrollment number
      QuerySnapshot snapshot = await _firestore
          .collection('students')
          .where('EN_NUM', isEqualTo: enNum)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        var studentData = snapshot.docs.first.data() as Map<String, dynamic>;

        // Check if the password matches
        if (studentData['PASS'] == password) {
          return studentData; // Successful login, return student data
        } else {
          return null; // Wrong password
        }
      } else {
        return null; // User not found
      }
    } catch (e) {
      print("Error logging in user: $e");
      return null;
    }
  }
}
