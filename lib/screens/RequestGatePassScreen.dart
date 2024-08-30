import 'package:flutter/material.dart';

class RequestGatePassScreen extends StatefulWidget {
  @override
  State<RequestGatePassScreen> createState() => _RequestGatePassScreenState();
}

class _RequestGatePassScreenState extends State<RequestGatePassScreen> {
  String? selectedLeaveType;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    TextEditingController _reason_controller = new TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration:
              BoxDecoration(color: Color(0xFFFF3B30)), // Red background color
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                        'Request Your Gate Pass',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Choose your leave type and get approval from \nthe right authority',
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
              Expanded(
                child: Container(
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
                        // Type of Leave Dropdown
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Type of Leave',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          value: selectedLeaveType,
                          items: [
                            DropdownMenuItem(
                              child: Text('Extended Leave'),
                              value: 'Extended Leave',
                            ),
                            DropdownMenuItem(
                              child: Text('Intra-day Leave'),
                              value: 'Intra-day Leave',
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedLeaveType = value;
                            });
                          },
                        ),
                        SizedBox(height: 35),

                        // Destination City input field
                        TextField(
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
                          controller: _reason_controller,
                          decoration: InputDecoration(
                            labelText: 'Reason for Moving Out',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            suffixIcon: Icon(Icons.clear),
                          ),
                        ),
                        SizedBox(height: 45),

                        // Request Leave Button
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF3B30),
                            padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 18), // Adjusted padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text('Request Leave',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
