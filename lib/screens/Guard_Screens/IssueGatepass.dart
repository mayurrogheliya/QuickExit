import 'package:flutter/material.dart';
import 'package:quick_exit/screens/Guard_Screens/IssueGatePass_tabs/TabBarContent.dart';

class IssueGatePass extends StatelessWidget {
  IssueGatePass({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(color: Colors.red),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
            child: Container(
              height: height * 0.18,
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
                      )),
                ],
              ),
            ),
          ),
          Container(
            height: height - (height * 0.18) - 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Container(child: TabBarContent()),
          )
        ],
      ),
    ));
  }
}
