import 'package:flutter/material.dart';

class VisitorCard extends StatelessWidget {
  final String reason;
  final String name;
  final String timestamp;
  final VoidCallback onApprove; // Add onApprove callback
  final VoidCallback onCall; // Add onCall callback

  VisitorCard({
    required this.reason,
    required this.name,
    required this.timestamp,
    required this.onApprove, // Pass callback
    required this.onCall, // Pass callback
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF5F8F9),
      margin: EdgeInsets.only(top: 12, left: 15, right: 15),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reason,
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400)),
                SizedBox(height: 2.0),
                Text(name,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                SizedBox(height: 2.0),
                Text('Entrance: $timestamp', style: TextStyle(fontSize: 14.0)),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 33,
                  width: 33,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFFF3B30),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.done_all),
                    color: Colors.white,
                    onPressed: onApprove, // Call onApprove
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 33,
                  width: 33,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0x2B2D4238),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.phone),
                    color: Colors.black,
                    onPressed: onCall, // Call onCall
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
