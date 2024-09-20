import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;

  Header({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(17.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ), // Rounded corners
        color: Color(0xFFFF3B30), // Background color
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 24.0, // Text size
                fontWeight: FontWeight.bold, // Text styling
              ),
            ),
          ),
        ],
      ),
    );
  }
}
