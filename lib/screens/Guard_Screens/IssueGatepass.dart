import 'package:flutter/material.dart';

class Issuegatepass extends StatefulWidget {
  const Issuegatepass({super.key});

  @override
  State<Issuegatepass> createState() => _IssuegatepassState();
}

class _IssuegatepassState extends State<Issuegatepass> {
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
                    'Issue Gate Pass',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                      "Quickly authorize Entry or Exit for\nstudents and visitors",
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
          Container(
            height: height - (height * 0.18) - 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
          )
        ],
      ),
    ));
  }
}
