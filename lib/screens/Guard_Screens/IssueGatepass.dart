import 'package:flutter/material.dart';

class IssueGatePass extends StatefulWidget {
  const IssueGatePass({super.key});

  @override
  _IssueGatePassScreenState createState() => _IssueGatePassScreenState();
}

class _IssueGatePassScreenState extends State<IssueGatePass> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              // Red Header Area
              Container(
                padding: const EdgeInsets.all(24),
                width: double.infinity,
                height: height * 0.18,
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Issue Gate Pass',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Quickly authorize entry or exit for students and visitors.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),

              // White Container with TabBar
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      // TabBar Styling
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: const [
                            Tab(text: "Students"),
                            Tab(text: "Visitors"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // TabBar View with Form Content
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Students Tab Content
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildTextInputField(
                                      "Enrollment Number", Icons.school),
                                  const SizedBox(height: 16),
                                  _buildTextInputField(
                                      "Destination City", Icons.location_city),
                                  const SizedBox(height: 16),
                                  _buildTextInputField(
                                      "Reason for Moving Out", Icons.info),
                                  const SizedBox(height: 32),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 16),
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: const Text("Issue Gate Pass"),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Visitors Tab Content
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildTextInputField(
                                      "Visitor Name", Icons.person),
                                  const SizedBox(height: 16),
                                  _buildTextInputField(
                                      "Purpose of Visit", Icons.work),
                                  const SizedBox(height: 16),
                                  _buildTextInputField(
                                      "Duration of Stay", Icons.access_time),
                                  const SizedBox(height: 32),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 16),
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: const Text("Issue Gate Pass"),
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
              ),
            ],
          ),

          // Bottom Navigation Bar
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromRGBO(43, 45, 66, 1),
            selectedItemColor: Colors.red[400],
            unselectedItemColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Issue GatePass"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: "Requests"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: "History"),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  // Custom Input Field Widget
  Widget _buildTextInputField(String labelText, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
