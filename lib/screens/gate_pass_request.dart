import 'package:flutter/material.dart';

class GatePassRequest extends StatefulWidget {
  const GatePassRequest({super.key});

  @override
  State<GatePassRequest> createState() => _GatePassRequestState();
}

class _GatePassRequestState extends State<GatePassRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Gate Pass Request",
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.grey.shade100,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Choose Leave Duration",
                  labelText: "Type of Leave",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  )),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter the city you are traveling to",
                  labelText: "Destination City",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  )),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "DD/MM/YYYY",
                  labelText: "Exit Date",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  )),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter the reason for your leave",
                  labelText: "Reason for Moving Out",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  )),
            ),
            SizedBox(
              height: 45,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text("Request Leave"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
