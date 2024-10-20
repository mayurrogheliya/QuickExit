import 'package:flutter/material.dart';
import 'package:quick_exit/screens/Guard_Screens/Header.dart';
import 'package:quick_exit/screens/Guard_Screens/CustomCard.dart';
import 'package:quick_exit/screens/Guard_Screens/NavBox.dart';
import 'package:quick_exit/screens/Guard_Screens/VisitorCard.dart';
import 'package:quick_exit/firebase/FirebaseOperations.dart'; 
import 'package:url_launcher/url_launcher.dart'; 

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
            screen1: StreamBuilder<List<Map<String, dynamic>>>(
              stream: _firebaseOps.fetchApprovedRequests(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No approved requests found.'));
                } else {
                  return Column(
                    children: snapshot.data!.map((request) {
                      return CustomCard(
                        leave: request['leave'],
                        name: request['name'],
                        destination: request['destination'],
                        exitDate: request['exitDate'],
                        reason: request['reason'],
                        buttonType: ButtonType.rightAndCall,
                        onApprove: () async {
                          //On Approve change the status to "Completed"
                          await _firebaseOps.updateRequestStatus(
                              request['id'], 'requests');
                          print('Approved: ${request['name']}');
                        },
                        onCall: () {
                          // Call functionality using phone number if available
                          _callPhoneNumber(request['phone']);
                        },
                      );
                    }).toList(),
                  );
                }
              },
            ),
            screen2: StreamBuilder<List<Map<String, dynamic>>>(
              stream: _firebaseOps
                  .fetchVisitorRequests(), 
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No visitors found.'));
                } else {
                  // Display the fetched visitor data
                  return Column(
                    children: snapshot.data!.map((visitor) {
                      return VisitorCard(
                        reason: visitor['reason'],
                        name: visitor['name'],
                        timestamp: visitor['ENTRY_TIME'],
                        onApprove: () async {
                          await _firebaseOps.updateRequestStatus(
                              visitor['id'], 'visitor_requests');
                          print('Visitor approved: ${visitor['name']}');
                        },
                        onCall: () {
                          // Call functionality using visitor's mobile number
                          _callPhoneNumber(visitor['mobileNumber']);
                        },
                      );
                    }).toList(),
                  );
                }
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
