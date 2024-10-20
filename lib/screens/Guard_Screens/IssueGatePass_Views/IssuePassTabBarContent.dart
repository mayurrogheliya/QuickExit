import 'package:flutter/material.dart';
import 'package:quick_exit/firebase/FirebaseOperations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IssuePassTabBarContent extends StatefulWidget {
  const IssuePassTabBarContent({super.key});

  @override
  _IssuePassTabBarContentState createState() => _IssuePassTabBarContentState();
}

class _IssuePassTabBarContentState extends State<IssuePassTabBarContent> {
  // Controllers for student form
  final TextEditingController _enNumController = TextEditingController();
  final TextEditingController _destiCityController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  // Controllers for visitor form
  final TextEditingController _visitorNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _idCardNumberController = TextEditingController();
  final TextEditingController _purposeOfVisitController =
      TextEditingController();

  // Function to issue gate pass for students
  Future<void> _issueGatePass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? empId = prefs.getString('empId');

    if (empId == null ||
        _enNumController.text.isEmpty ||
        _destiCityController.text.isEmpty ||
        _reasonController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please fill all fields and ensure empId is set.')));
      return;
    }

    try {
      await FirebaseOperations().issueGatePass(
        empId: empId,
        destiCity: _destiCityController.text,
        enNum: _enNumController.text,
        reason: _reasonController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gate Pass issued successfully!')));
      _enNumController.clear();
      _destiCityController.clear();
      _reasonController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error issuing Gate Pass: $e')));
    }
  }

  // Function to issue gate pass for visitors
  Future<void> _issueVisitorGatePass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? empId = prefs.getString('empId');

    if (empId == null ||
        _visitorNameController.text.isEmpty ||
        _mobileNumberController.text.isEmpty ||
        _idCardNumberController.text.isEmpty ||
        _purposeOfVisitController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please fill all fields and ensure empId is set.')));
      return;
    }

    try {
      await FirebaseOperations().issueVisitorGatePass(
        empId: empId,
        visitorName: _visitorNameController.text,
        mobileNumber: _mobileNumberController.text,
        idCardNumber: _idCardNumberController.text,
        purposeOfVisit: _purposeOfVisitController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Visitor Gate Pass issued successfully!')));
      _visitorNameController.clear();
      _mobileNumberController.clear();
      _idCardNumberController.clear();
      _purposeOfVisitController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error issuing Visitor Gate Pass: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          // Students Tab Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextInputField(
                    "Enrollment Number", Icons.school, _enNumController),
                const SizedBox(height: 30),
                _buildTextInputField("Destination City", Icons.location_city,
                    _destiCityController),
                const SizedBox(height: 30),
                _buildTextInputField(
                    "Reason for Moving Out", Icons.info, _reasonController),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: _issueGatePass, // Call the function for students
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
                _buildTextInputField(
                    "Visitor Name", Icons.person, _visitorNameController),
                const SizedBox(height: 20),
                _buildTextInputField("Mobile Number", Icons.phone_iphone,
                    _mobileNumberController),
                const SizedBox(height: 20),
                _buildTextInputField("ID Card Number", Icons.payments_sharp,
                    _idCardNumberController),
                const SizedBox(height: 20),
                _buildTextInputField("Purpose of Visit", Icons.paste_sharp,
                    _purposeOfVisitController),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed:
                        _issueVisitorGatePass, // Call the function for visitors
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 18),
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

  // Custom Input Field Widget with Controller
  Widget _buildTextInputField(
      String labelText, IconData icon, TextEditingController controller) {
    return TextField(
      controller: controller,
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
