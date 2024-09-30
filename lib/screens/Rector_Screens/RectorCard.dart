import 'package:flutter/material.dart';

class CallCard extends StatelessWidget {
  final String? leave;
  final String name;
  final String destination;
  final String exitDate;
  final String? reason;

  CallCard({
    this.leave,
    required this.name,
    required this.destination,
    required this.exitDate,
    this.reason,
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
          crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start vertically
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between left and right parts
          children: [
            // Left side (Details)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [
                if (leave != null && leave!.isNotEmpty)
                  Text(
                    '$leave',
                    style: TextStyle(fontSize: 14.0),
                  ),
                SizedBox(height: 2.0),
                Text(
                  '$name',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 2.0), // Space between items
                Text(
                  'Destination: $destination',
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(height: 2.0),
                Text(
                  'Exit Date: $exitDate',
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(height: 2.0),
                if (reason != null && reason!.isNotEmpty)
                  Text(
                    'Reason: $reason',
                    style: TextStyle(fontSize: 14.0),
                  ),
              ],
            ),

            // Right side (Call Button)
            Container(
              height: 33,
              width: 33,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(5),
                color: Color(0x2B2D4238),
              ),
              child: IconButton(
                icon: Icon(Icons.phone),
                padding: EdgeInsets.zero,
                color: Colors.black,
                onPressed: () {
                  // Add action for the call button
                  print('Calling');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
