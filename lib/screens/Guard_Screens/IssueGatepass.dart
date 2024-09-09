import 'package:flutter/material.dart';

class Issuegatepass extends StatefulWidget {
  const Issuegatepass({super.key});

  @override
  State<Issuegatepass> createState() => _IssuegatepassState();
}

class _IssuegatepassState extends State<Issuegatepass> {
  // For _selectedIndex value to persist, its outside the build() method
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
              height: height - (height * 0.16) - 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(43, 45, 66, 1),
        selectedItemColor: Colors.red[400],
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Issue Gatepass"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Requests"),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_history), label: "History"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    ));
  }
}
