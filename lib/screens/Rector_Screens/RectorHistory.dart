import 'package:flutter/material.dart';
import 'package:quick_exit/screens/Guard_Screens/Header.dart';
import 'package:quick_exit/screens/Guard_Screens/CustomCard.dart';
import 'package:quick_exit/firebase/FirebaseOperations.dart';
import 'package:url_launcher/url_launcher.dart';

class RectorHistory extends StatefulWidget {
  const RectorHistory({super.key});

  @override
  State<RectorHistory> createState() => _RectorHistoryState();
}

class _RectorHistoryState extends State<RectorHistory> {
  final FirebaseOperations _firebaseOps = FirebaseOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(title: "Extended Leave History"),
          StreamBuilder<List<Map<String, dynamic>>>(
            stream: _firebaseOps.fetchApprovedRequestsRector(),
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
                      buttonType: ButtonType.rightAndCall, // Only call button
                      onCall: () {
                        _callPhoneNumber(request['phone']);
                      },
                      onApprove: () {}, // Dummy, as no approve action needed
                    );
                  }).toList(),
                );
              }
            },
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
