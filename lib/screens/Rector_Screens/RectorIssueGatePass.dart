import 'package:flutter/material.dart';
import 'package:quick_exit/firebase/FirebaseOperations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart'; // For date formatting

class RectorIssueGatePass extends StatefulWidget {
  @override
  State<RectorIssueGatePass> createState() => _RectorIssueGatePassState();
}

class _RectorIssueGatePassState extends State<RectorIssueGatePass> {
  final FirebaseOperations _firebaseOperations = FirebaseOperations();
  DateTime? selectedDate;
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _enNumController = TextEditingController();

  // Method to handle the leave request submission
  void _handleLeaveRequest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? empId = prefs.getString('empId');

    if (empId == null ||
        _enNumController.text.isEmpty ||
        _destinationController.text.isEmpty ||
        _reasonController.text.isEmpty ||
        selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please fill all fields and ensure empId is set.')));
      return;
    }

    try {
      // Formatting selectedDate for storage
      String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate!);

      await _firebaseOperations.issueLeave(
        empId: empId,
        destiCity: _destinationController.text,
        enNum: _enNumController.text,
        reason: _reasonController.text,
        exitDate: formattedDate, 
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gate Pass successfully issued!')),
      );
      _enNumController.clear();
      _destinationController.clear();
      _reasonController.clear();
      selectedDate = null;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error issuing Gate Pass: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration:
                BoxDecoration(color: Color(0xFFFF3B30)), // Red background color
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Red Container
                Container(
                  height: height * 0.22,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 24.0, right: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Issue Your Gate Pass',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Quickly Authorize entry and exit for hostelers',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom White Container Items
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 11),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 55),
                    child: Column(
                      children: [
                        // Enrollment Number input field
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Enrollment Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            suffixIcon: Icon(Icons.clear),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _enNumController.text = value;
                            });
                          },
                        ),
                        SizedBox(height: 35),

                        // Destination City input field
                        TextField(
                          controller: _destinationController,
                          decoration: InputDecoration(
                            labelText: 'Destination City',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            suffixIcon: Icon(Icons.clear),
                          ),
                        ),
                        SizedBox(height: 35),

                        // Exit Date input field with date picker
                        TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Exit Date',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          onTap: () async {
                            DateTime now = DateTime.now();
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: now,
                              firstDate: DateTime(now.year, now.month, now.day),
                              lastDate: now.add(Duration(days: 30)),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                selectedDate = pickedDate;
                              });
                            }
                          },
                          controller: TextEditingController(
                            text: selectedDate != null
                                ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                : "",
                          ),
                        ),
                        SizedBox(height: 35),

                        // Reason for Moving Out input field
                        TextField(
                          controller: _reasonController,
                          decoration: InputDecoration(
                            labelText: 'Reason for Moving Out',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            suffixIcon: Icon(Icons.clear),
                          ),
                        ),
                        SizedBox(height: 45),

                        // Issue Leave Button
                        ElevatedButton(
                          onPressed: _handleLeaveRequest,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF3B30),
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text('Issue Leave',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
