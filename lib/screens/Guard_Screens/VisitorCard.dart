import 'package:flutter/material.dart';

class VisitorCard extends StatelessWidget {
  final String reason;
  final String name;
  final String timestamp;

  VisitorCard({
    required this.reason,
    required this.name,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF5F8F9),
      margin: EdgeInsets.only(
          top: 12, left: 15, right: 15), // Margin around the card
      child: Padding(
        padding: EdgeInsets.all(16.0), // Padding inside the card
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the start vertically
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Space between left and right parts
          children: [
            // Left side (Details)
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the left
              children: [
                Text(
                  '$reason',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 2.0),
                Text(
                  '$name',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 2.0),
                Text(
                  'Entrance: $timestamp',
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),

            // Right side (Buttons)
            Row(
              children: [
                // check button
                Container(
                  height: 33,
                  width: 33,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFFF3B30),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.done_all),
                    padding: EdgeInsets.zero,
                    color: Colors.white,
                    onPressed: () {
                      // Add action for the checkmark button
                      print('Approved');
                    },
                  ),
                ),

                // phone button
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 33,
                  width: 33,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0x2B2D4238),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.phone),
                    padding: EdgeInsets.zero,
                    color: Colors.black,
                    onPressed: () {
                      // Add action for the X button
                      print('Calling');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
