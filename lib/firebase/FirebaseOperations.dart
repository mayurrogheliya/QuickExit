import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

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

  Future<void> issueGatePass({
    required String empId,
    required String destiCity,
    required String enNum,
    required String reason,
  }) async {
    // Get today's date
    String exitDate =
        DateTime.now().toString().substring(0, 10); // 'YYYY-MM-DD'

    // Prepare the request data
    Map<String, dynamic> requestData = {
      'APPROVED_BY': empId,
      'DESTI_CITY': destiCity,
      'EN_NUM': enNum,
      'EXIT_DATE': exitDate,
      'LEAVE_TYPE': 'Intra-day Leave',
      'REASON': reason,
      'STATUS': 'Approved',
      'timestamp':
          FieldValue.serverTimestamp(), // Use Firebase's server timestamp
    };

    try {
      // Add the request to Firebase Firestore
      await FirebaseFirestore.instance.collection('requests').add(requestData);
    } catch (e) {
      throw Exception('Error issuing Gate Pass: $e');
    }
  }

  // Function to add gate pass request for Visitors to Firebase
  Future<void> issueVisitorGatePass({
    required String empId,
    required String visitorName,
    required String mobileNumber,
    required String idCardNumber,
    required String purposeOfVisit,
  }) async {
    // Get current time in HH:MM format
    String entryTime = DateFormat('HH:mm').format(DateTime.now());

    // Prepare the request data for visitors
    Map<String, dynamic> visitorData = {
      'APPROVED_BY': empId,
      'VISITOR_NAME': visitorName,
      'MOBILE_NUMBER': mobileNumber,
      'ID_CARD_NUMBER': idCardNumber,
      'PURPOSE_OF_VISIT': purposeOfVisit,
      'ENTRY_TIME': entryTime,
      'STATUS': 'Approved',
      'timestamp': FieldValue.serverTimestamp(),
    };

    try {
      // Add the visitor request to Firebase Firestore
      await FirebaseFirestore.instance
          .collection('visitor_requests')
          .add(visitorData);
    } catch (e) {
      throw Exception('Error issuing Visitor Gate Pass: $e');
    }
  }

  Stream<List<Map<String, dynamic>>> fetchApprovedRequests() {
    return FirebaseFirestore.instance
        .collection('requests')
        .where('STATUS', isEqualTo: 'Approved')
        .snapshots()
        .asyncMap((snapshot) async {
      List<Map<String, dynamic>> requestsList = [];

      for (var requestDoc in snapshot.docs) {
        String enNum = requestDoc['EN_NUM'];
        String reason = requestDoc['REASON'] ?? 'N/A';

        // Fetch student details using EN_NUM
        Map<String, dynamic>? studentData = await getStudentData(enNum);

        if (studentData != null) {
          String fname = studentData['FNAME'];
          String lname = studentData['LNAME'];
          String phone = studentData['PHONE'];
          String fullName = '$fname $lname';

          requestsList.add({
            'id': requestDoc.id, // Include document ID
            'name': fullName,
            'leave': requestDoc['LEAVE_TYPE'],
            'destination': requestDoc['DESTI_CITY'],
            'exitDate': requestDoc['EXIT_DATE'],
            'reason': reason,
            'phone': phone
          });
        }
      }
      return requestsList;
    });
  }

  // Fetch all visitor requests
  Stream<List<Map<String, dynamic>>> fetchVisitorRequests() {
    return FirebaseFirestore.instance
        .collection(
            'visitor_requests') // Ensure this is the correct collection name
        .where('STATUS', isEqualTo: 'Approved') // Filter for approved visitors
        .snapshots()
        .map((snapshot) {
      // Map the documents to a list of maps
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return {
          'id': doc.id, // Include document ID
          'name': data['VISITOR_NAME'],
          'reason': data['PURPOSE_OF_VISIT'] ?? 'N/A',
          'ENTRY_TIME': data['ENTRY_TIME'] ?? 'Unknown',
          'mobileNumber': data['MOBILE_NUMBER'] ?? 'Unknown',
        };
      }).toList();
    });
  }

  // Update request status to "Completed"
  Future<void> updateRequestStatus(String docId, String collection) async {
    try {
      await _firestore.collection(collection).doc(docId).update({
        'STATUS': 'Completed',
      });
    } catch (e) {
      print('Error updating status: $e');
    }
  }
}
