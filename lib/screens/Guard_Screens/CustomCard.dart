import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String destination;
  final String exitDate;
  final String reason;

  CustomCard({
    required this.name,
    required this.destination,
    required this.exitDate,
    required this.reason,
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
                  '$name',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 3.0), // Space between items
                Text(
                  'Destination: $destination',
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(height: 3.0),
                Text(
                  'Exit Date: $exitDate',
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(height: 3.0),
                Text(
                  'Reason: $reason',
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),

            // Right side (Buttons)
            Row(
              children: [
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
                    icon: Icon(Icons.check),
                    padding: EdgeInsets.zero,
                    color: Colors.white,
                    onPressed: () {
                      // Add action for the checkmark button
                      print('Approved');
                    },
                  ),
                ),
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
                    icon: Icon(Icons.close),
                    padding: EdgeInsets.zero,
                    color: Colors.black,
                    onPressed: () {
                      // Add action for the X button
                      print('Rejected');
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
