import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quick_exit/screens/Guard_Screens/CustomCard.dart';
import 'package:quick_exit/screens/Guard_Screens/Header.dart';

class RectorRequests extends StatefulWidget {
  const RectorRequests({super.key});

  @override
  State<RectorRequests> createState() => _RectorRequestsState();
}

class _RectorRequestsState extends State<RectorRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(title: "Gate Pass Requests"),
          CustomCard(
            name: "Mayur Rogheliya",
            destination: "Rajkot",
            exitDate: "15-09-2024",
            reason: "Medical",
            buttonType: ButtonType.rightAndCancel,
          ),
          CustomCard(
            name: "Paul Stephen",
            destination: "Ahmedabad",
            exitDate: "30-09-2024",
            reason: "Shopping",
            buttonType: ButtonType.rightAndCancel,
          ),
          CustomCard(
            name: "Dhruv Burada",
            destination: "Tramba",
            exitDate: "17-09-2024",
            reason: "Marriage",
            buttonType: ButtonType.rightAndCancel,
          ),
        ],
      ),
    );
  }
}
