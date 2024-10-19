import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_exit/screens/Guard_Screens/Header.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quick_exit/firebase/FirebaseOperations.dart'; // Make sure to import your Firebase operations file

class Requests extends StatefulWidget {
  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  String? empId;

  @override
  void initState() {
    super.initState();
    _loadEmpId();
  }

  Future<void> _loadEmpId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      empId = prefs.getString('empId');
    });
  }

  Future<void> updateRequestStatus(String requestId, String newStatus) async {
    if (empId == null) return;

    try {
      await FirebaseFirestore.instance
          .collection('requests')
          .doc(requestId)
          .update({
        'STATUS': newStatus,
        'APPROVED_BY': empId,
      });
    } catch (e) {
      print('Error updating request: $e');
    }
  }

  Future<String> getStudentFullName(String enNum) async {
    final firebaseOps =
        FirebaseOperations(); // Assuming you have a FirebaseOperations class
    final studentData = await firebaseOps.getStudentData(enNum);

    if (studentData != null) {
      String fName = studentData['FNAME'];
      String lName = studentData['LNAME'];
      return '$fName $lName';
    } else {
      return 'Unknown Student';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(title: "Gate Pass Requests"), // Add Header at the top
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('requests')
                  .where('LEAVE_TYPE', isEqualTo: 'Intra-day Leave')
                  .where('STATUS', isEqualTo: 'Pending') // Only pending status
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    // Get the enrollment number
                    String enNum = doc['EN_NUM'];

                    // Use FutureBuilder to fetch student name asynchronously
                    return FutureBuilder<String>(
                      future: getStudentFullName(enNum),
                      builder: (context, AsyncSnapshot<String> nameSnapshot) {
                        if (!nameSnapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }

                        return Card(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${nameSnapshot.data}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800),
                                    ), // Display FNAME + LNAME
                                    Text('Destination: ${doc['DESTI_CITY']}'),
                                    Text('Exit Date: ${doc['EXIT_DATE']}'),
                                    Text('Reason: ${doc['REASON']}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 10),
                                    // Reject button
                                    Container(
                                      height: 33,
                                      width: 33,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0x2B2D4238),
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.close,
                                            color: Colors.black),
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          updateRequestStatus(
                                              doc.id, 'Rejected');
                                        },
                                      ),
                                    ),
                                    // Approve button
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 33,
                                      width: 33,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFFF3B30),
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.check,
                                            color: Colors.white),
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          updateRequestStatus(
                                              doc.id, 'Approved');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
