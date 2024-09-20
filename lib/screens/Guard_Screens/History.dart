import 'package:flutter/material.dart';
import 'package:quick_exit/screens/Guard_Screens/Header.dart';
import 'package:quick_exit/screens/Guard_Screens/CustomCard.dart';

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
    );
  }
}
