import 'package:flutter/material.dart';
import 'package:quick_exit/screens/Guard_Screens/Header.dart';
import 'package:quick_exit/screens/Rector_Screens/RectorCard.dart';

class RectorHistory extends StatefulWidget {
  const RectorHistory({super.key});

  @override
  State<RectorHistory> createState() => _RectorHistoryState();
}

class _RectorHistoryState extends State<RectorHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(title: "Gate Pass History"),
          // Displaying Student Cards
          Column(
            children: [
              CallCard(
                leave: "Extended Leave",
                name: "Mayur Rogheliya",
                destination: "Rajkot",
                exitDate: "15-09-2024",
              ),
              CallCard(
                leave: "Day Leave",
                name: "Paul Stephen",
                destination: "Ahmedabad",
                exitDate: "30-09-2024",
              ),
              CallCard(
                leave: "Extended Leave",
                name: "Dhruv Burada",
                destination: "Tramba",
                exitDate: "17-09-2024",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
