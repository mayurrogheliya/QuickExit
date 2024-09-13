import 'package:flutter/material.dart';

class TabBarContent extends StatelessWidget {
  const TabBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          // TabBar Styling
          Container(
            margin: const EdgeInsets.only(top: 24),
            width: 300,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(50),
                border: Border(bottom: BorderSide.none)),
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
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextInputField("Enrollment Number", Icons.school),
                      const SizedBox(height: 16),
                      _buildTextInputField(
                          "Destination City", Icons.location_city),
                      const SizedBox(height: 16),
                      _buildTextInputField("Reason for Moving Out", Icons.info),
                      const SizedBox(height: 32),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 16),
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Issue Gate Pass",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Visitors Tab Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextInputField("Visitor Name", Icons.person),
                      const SizedBox(height: 16),
                      _buildTextInputField("Mobile Number", Icons.phone_iphone),
                      const SizedBox(height: 16),
                      _buildTextInputField(
                          "ID Card Number", Icons.payments_sharp),
                      const SizedBox(height: 16),
                      _buildTextInputField(
                          "Purpose of Visit", Icons.paste_sharp),
                      const SizedBox(height: 32),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 16),
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Issue Gate Pass",
                            style: TextStyle(color: Colors.white),
                          ),
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
