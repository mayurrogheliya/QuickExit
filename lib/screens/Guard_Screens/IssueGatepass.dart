import 'package:flutter/material.dart';

class Issuegatepass extends StatefulWidget {
  const Issuegatepass({super.key});

  @override
  State<Issuegatepass> createState() => _IssuegatepassState();
}

class _IssuegatepassState extends State<Issuegatepass>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    print(keyboardHeight);

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Colors.red),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
              child: Container(
                height: height * 0.18 - keyboardHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Issue Gate Pass',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                        "Quickly authorize Entry or Exit for\nstudents and visitors",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 1,
                        ))
                  ],
                ),
              ),
            ),
            Container(
              height: height - (height * 0.18) - 130,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Student'),
                      Tab(text: 'Visitor'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 45, right: 45),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Enter Enrollment Number',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              SizedBox(height: 25),
                              TextField(
                                decoration: InputDecoration(
                                    labelText: 'Destination City',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                              ),
                              SizedBox(height: 25),
                              TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  labelText: 'Reason for Moving Out',
                                ),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle gate pass issuance
                                },
                                child: Text('Issue Gate Pass'),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Name of the Visitor',
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Mobile Number',
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'ID Card',
                                ),
                              ),
                              DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'Reason for Visit',
                                ),
                                items: [
                                  DropdownMenuItem(
                                    value: 'Appointment',
                                    child: Text('Appointment'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Admission',
                                    child: Text('Admission'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Guest Invitation',
                                    child: Text('Guest Invitation'),
                                  ),
                                ],
                                onChanged: (value) {
                                  // Handle reason selection
                                },
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle gate pass issuance
                                },
                                child: Text('Issue Gate Pass'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
