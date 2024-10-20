import 'package:flutter/material.dart';

enum ButtonType { rightAndCall, rightAndCancel }

class CustomCard extends StatelessWidget {
  final String? leave;
  final String name;
  final String destination;
  final String exitDate;
  final String? reason;
  final ButtonType buttonType;
  final VoidCallback onApprove; // Add onApprove callback
  final VoidCallback onCall; // Add onCall callback

  CustomCard({
    this.leave,
    required this.name,
    required this.destination,
    required this.exitDate,
    this.reason,
    required this.buttonType,
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
                if (leave != null && leave!.isNotEmpty)
                  Text('$leave', style: TextStyle(fontSize: 14.0)),
                SizedBox(height: 2.0),
                Text(name,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                SizedBox(height: 2.0),
                Text('Destination: $destination',
                    style: TextStyle(fontSize: 14.0)),
                SizedBox(height: 2.0),
                Text('Exit Date: $exitDate', style: TextStyle(fontSize: 14.0)),
                if (reason != null && reason!.isNotEmpty) SizedBox(height: 2.0),
                Text('Reason: $reason', style: TextStyle(fontSize: 14.0)),
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
                if (buttonType == ButtonType.rightAndCall) SizedBox(width: 10),
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
