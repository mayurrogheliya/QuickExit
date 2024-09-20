import 'package:flutter/material.dart';

class NavBox extends StatefulWidget {
  final String title1;
  final String title2;
  final Widget screen1;
  final Widget screen2;

  NavBox({
    required this.title1,
    required this.title2,
    required this.screen1,
    required this.screen2,
  });

  @override
  _NavBoxState createState() => _NavBoxState();
}

class _NavBoxState extends State<NavBox> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.2), // Adjust the color and opacity as needed
                blurRadius: 6, // Adjust the blur radius
                spreadRadius: 1, // Adjust the spread radius
                offset: Offset(0, 2), // Adjust the offset for the shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _onItemTapped(0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: _selectedIndex == 0 ? Colors.red : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.title1,
                        style: TextStyle(
                            color: _selectedIndex == 0
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => _onItemTapped(1),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: _selectedIndex == 1 ? Colors.red : Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.title2,
                        style: TextStyle(
                            color: _selectedIndex == 1
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        _selectedIndex == 0 ? widget.screen1 : widget.screen2,
      ],
    );
  }
}
