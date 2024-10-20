import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quick_exit/screens/Guard_Screens/Header.dart';
import 'package:quick_exit/screens/Guard_Screens/CustomCard.dart';
import 'package:quick_exit/screens/Guard_Screens/NavBox.dart';
import 'package:quick_exit/screens/Guard_Screens/VisitorCard.dart';
import 'package:quick_exit/firebase/FirebaseOperations.dart'; // Import FirebaseOperations
import 'package:url_launcher/url_launcher.dart'; // For phone dialer

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final FirebaseOperations _firebaseOps = FirebaseOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(title: "Gate Pass History"),
          NavBox(
            title1: "Students",
            title2: "Visitors",
            screen1: StreamBuilder<QuerySnapshot>(
              stream: _firebaseOps.fetchApprovedRequests(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                var requests = snapshot.data!.docs;
                return Column(
                  children: requests.map((doc) {
                    var data = doc.data() as Map<String, dynamic>;
                    return CustomCard(
                      reason: data["REASON"],
                      leave: data['LEAVE_TYPE'] ??
                          'Unknown Leave', // Provide a default value if LEAVE_TYPE is null
                      name: (data['FNAME'] ?? 'Unknown') +
                          " " +
                          (data['LNAME'] ??
                              'Name'), // Handle null values for FNAME and LNAME
                      destination: data['DESTI_CITY'] ??
                          'Unknown Destination', // Provide a default for DESTI_CITY
                      exitDate: data['EXIT_DATE'] ??
                          'Unknown Date', // Provide a default for EXIT_DATE
                      buttonType: ButtonType.rightAndCall,
                      onApprove: () => _firebaseOps.updateRequestStatus(
                        doc.id,
                        'requests',
                      ),
                      onCall: () => _callPhoneNumber(
                          data['PHONE'] ?? ''), // Handle null PHONE field
                    );
                  }).toList(),
                );
              },
            ),
            screen2: StreamBuilder<QuerySnapshot>(
              stream: _firebaseOps.fetchVisitorRequests(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                var requests = snapshot.data!.docs;
                return Column(
                  children: requests.map((doc) {
                    var data = doc.data() as Map<String, dynamic>;
                    return VisitorCard(
                      reason: data['PURPOSE_OF_VISIT'] ??
                          'Unknown Reason', // Provide a default for REASON
                      name: data['VISITOR_NAME'] ??
                          'Unknown Name', // Provide a default for NAME
                      timestamp: data['ENTRY_TIME'] ??
                          'Unknown Time', // Provide a default for ENTRY_TIME
                      onApprove: () => _firebaseOps.updateRequestStatus(
                        doc.id,
                        'visitor_requests',
                      ),
                      onCall: () => _callPhoneNumber(data['MOBILE_NUMBER'] ??
                          ''), // Handle null PHONE field
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

  // Launch phone dialer with the given phone number
  void _callPhoneNumber(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      print('Could not launch phone dialer');
    }
  }
}
