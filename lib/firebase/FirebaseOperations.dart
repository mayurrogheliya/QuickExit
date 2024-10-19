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
          return studentData;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("Error logging in user: $e");
      return null;
    }
  }

  Future<DocumentSnapshot?> loginEmployee(String empId, String password) async {
    try {
      var employee = await _firestore
          .collection('employee')
          .where('EMP_ID', isEqualTo: empId)
          .where('PASS', isEqualTo: password)
          .limit(1)
          .get();

      if (employee.docs.isNotEmpty) {
        return employee.docs.first;
      }
    } catch (e) {
      print("Error logging in: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> getStudentData(String enNum) async {
    try {
      // Query the students collection where EN_NUM matches the given enrollment number
      QuerySnapshot querySnapshot = await _firestore
          .collection('students')
          .where('EN_NUM', isEqualTo: enNum)
          .get();

      // Check if any document matches the query
      if (querySnapshot.docs.isNotEmpty) {
        // Get the first matching document (since enrollment number should be unique)
        DocumentSnapshot studentSnapshot = querySnapshot.docs.first;

        // Return the student data as a map
        return studentSnapshot.data() as Map<String, dynamic>;
      } else {
        // If no matching document is found, return null
        return null;
      }
    } catch (e) {
      print('Error fetching student data: $e');
      return null;
    }
  }

  Future<void> addRequest({
    required String enNum,
    required String leaveType,
    required String destinationCity,
    required String exitDate,
    required String reason,
    required String status,
  }) async {
    try {
      await _firestore.collection('requests').add({
        'EN_NUM': enNum,
        'LEAVE_TYPE': leaveType,
        'DESTI_CITY': destinationCity,
        'EXIT_DATE': exitDate,
        'REASON': reason,
        'STATUS': status,
        'APPROVED_BY': '',
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error issuing gate pass: $e');
      throw e; // Rethrow error for potential handling
    }
  }
}
