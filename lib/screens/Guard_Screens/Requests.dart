import 'package:flutter/material.dart';
import 'package:quick_exit/screens/Guard_Screens/CustomCard.dart';
import 'package:quick_exit/screens/Guard_Screens/Header.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
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
          ),
          CustomCard(
            name: "Paul Stephen",
            destination: "Ahmedabad",
            exitDate: "30-09-2024",
            reason: "Shopping",
          ),
          CustomCard(
            name: "Dhruv Burada",
            destination: "Tramba",
            exitDate: "17-09-2024",
            reason: "Marriage",
          ),
        ],
      ),
    );
  }
}
