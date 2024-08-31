import 'package:flutter/material.dart';
import 'package:quick_exit/screens/Guard_Screens/History.dart';
import 'package:quick_exit/screens/Guard_Screens/IssueGatepass.dart';
import 'package:quick_exit/screens/Guard_Screens/Requests.dart';

class GuardNavBar extends StatefulWidget {
  const GuardNavBar({super.key});

  @override
  State<GuardNavBar> createState() => _GuardNavBarState();
}

class _GuardNavBarState extends State<GuardNavBar> {
  int currIndex = 0;
  List pages = [
    Issuegatepass(),
    Requests(),
    History(),
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
            label: 'Issue Gatepass',
            index: 0,
          ),
          _buildBarItem(
            icon: Image.asset(
              'icons/Requests.png',
              height: 30,
              width: 30,
            ),
            label: 'Requests',
            index: 1,
          ),
          _buildBarItem(
            icon: Icons.history,
            label: 'History',
            index: 2,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBarItem({
    required dynamic icon, // Accepts both IconData and Image
    required String label,
    required int index,
  }) {
    //If the index we are at now is the same index of the item the isSelected is true
    bool isSelected = currIndex == index;

    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0.5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: _buildIconWidget(icon, isSelected),
      ),
      label: label,
    );
  }

  Widget _buildIconWidget(dynamic icon, bool isSelected) {
    if (icon is IconData) {
      return Icon(
        icon,
        size: 30,
        color: isSelected ? Colors.black : Colors.white,
      );
    } else if (icon is Image) {
      {
        if (!isSelected) {
          return Image.asset(
            "icons/Requests-not-selected.png",
            height: 30,
            width: 30,
          );
        }
      }

      return icon;
    } else {
      return Container();
    }
  }
}
