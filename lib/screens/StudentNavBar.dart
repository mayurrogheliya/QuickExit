import 'package:flutter/material.dart';
import 'package:quick_exit/screens/RequestGatePassScreen.dart';
import 'package:quick_exit/screens/StudentHistory.dart';
import 'package:quick_exit/screens/StudentProfile.dart';

class StudentNavbar extends StatefulWidget {
  const StudentNavbar({super.key});

  @override
  State<StudentNavbar> createState() => _StudentNavbarState();
}

class _StudentNavbarState extends State<StudentNavbar> {
  int currIndex = 0;
  List pages = [
    RequestGatePassScreen(),
    StudentHistory(),
    StudentProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(43, 45, 66, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: currIndex,
        onTap: (index) {
          setState(() {
            currIndex = index;
          });
        },
        items: [
          _buildBarItem(
            icon: Icons.badge,
            label: 'Pass Request',
            index: 0,
          ),
          _buildBarItem(
            icon: Icons.history,
            label: 'History',
            index: 1,
          ),
          _buildBarItem(
            icon: Icons.person,
            label: 'Profile',
            index: 2,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBarItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool isSelected = currIndex == index;

    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0.5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          size: 30,
          color: isSelected ? Colors.black : Colors.white,
        ),
      ),
      label: label,
    );
  }
}
