import 'package:flutter/material.dart';
import 'package:quick_exit/screens/Guard_Screens/Header.dart';
import 'package:quick_exit/screens/Guard_Screens/CustomCard.dart';
import 'package:quick_exit/screens/Guard_Screens/NavBox.dart';
import 'package:quick_exit/screens/Guard_Screens/VisitorCard.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(title: "Gate Pass History"),
          NavBox(
            title1: "Students",
            title2: "Visitors",
            screen1: Column(
              children: [
                CustomCard(
                  leave: "Extended Leave",
                  name: "Mayur Rogheliya",
                  destination: "Rajkot",
                  exitDate: "15-09-2024",
                  buttonType: ButtonType.rightAndCall,
                ),
                CustomCard(
                  leave: "Day Leave",
                  name: "Paul Stephen",
                  destination: "Ahmedabad",
                  exitDate: "30-09-2024",
                  buttonType: ButtonType.rightAndCall,
                ),
                CustomCard(
                  leave: "Extended Leave",
                  name: "Dhruv Burada",
                  destination: "Tramba",
                  exitDate: "17-09-2024",
                  buttonType: ButtonType.rightAndCall,
                ),
              ],
            ),
            screen2: Column(
              children: [
                VisitorCard(
                  reason: "Appointment",
                  name: "Meet Pitroda",
                  timestamp: "10:00 AM",
                ),
                VisitorCard(
                  reason: "Chief Guest",
                  name: "Brijesh Sakhiya",
                  timestamp: "12:00 AM",
                ),
                VisitorCard(
                  reason: "Admission",
                  name: "Archil Gajera",
                  timestamp: "10:15 AM",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
