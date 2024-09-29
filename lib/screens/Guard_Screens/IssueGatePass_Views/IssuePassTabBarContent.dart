import 'package:flutter/material.dart';

class IssuePassTabBarContent extends StatelessWidget {
  const IssuePassTabBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    // TabBar View with Form Content
    return Expanded(
      child: TabBarView(
        children: [
          // Students Tab Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextInputField("Enrollment Number", Icons.school),
                const SizedBox(height: 30),
                _buildTextInputField("Destination City", Icons.location_city),
                const SizedBox(height: 30),
                _buildTextInputField("Reason for Moving Out", Icons.info),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextInputField("Visitor Name", Icons.person),
                const SizedBox(height: 30),
                _buildTextInputField("Mobile Number", Icons.phone_iphone),
                const SizedBox(height: 30),
                _buildTextInputField("ID Card Number", Icons.payments_sharp),
                const SizedBox(height: 30),
                _buildTextInputField("Purpose of Visit", Icons.paste_sharp),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
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
    );
  }

  // Custom Input Field Widget
  Widget _buildTextInputField(String labelText, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20),
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
