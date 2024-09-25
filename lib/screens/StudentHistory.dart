import 'package:flutter/material.dart';
import 'package:quick_exit/screens/HistoryCard.dart';

class StudentHistory extends StatefulWidget {
  const StudentHistory({super.key});

  @override
  State<StudentHistory> createState() => _StudentHistoryState();
}

class _StudentHistoryState extends State<StudentHistory> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.red),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.22,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gate Pass History',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Text(
                          "Review your gatepass request\nand see their current status",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1,
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            SizedBox(height: 20), // Add space between cards
                            HistoryCard(
                                leave: "Extended",
                                destination: "Gondal",
                                exitDate: "25-09-2024",
                                status: "Approved"),
                            SizedBox(height: 3), // Add space between cards
                            HistoryCard(
                                leave: "Day",
                                destination: "Rajkot",
                                exitDate: "15-10-2024",
                                status: "Pending"),
                            SizedBox(height: 3),
                            HistoryCard(
                                leave: "Extended",
                                destination: "Ahmedabad",
                                exitDate: "10-09-2024",
                                status: "Cancelled"),
                            // Add more HistoryCards as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
