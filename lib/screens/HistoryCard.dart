import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String leave;
  final String destination;
  final String exitDate;
  final String status;

  HistoryCard({
    required this.leave,
    required this.destination,
    required this.exitDate,
    required this.status,
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
                  '$leave Leave',
                  style: TextStyle(fontSize: 14.0),
                ),
                Text(
                  '$destination',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  'Exit Date: $exitDate',
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                backgroundColor: Color(0xFFF5F8F9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    side: BorderSide(color: Colors.black, width: 1)),
              ),
              child: Text(
                status,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
