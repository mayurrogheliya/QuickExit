import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_exit/screens/HistoryCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentHistory extends StatefulWidget {
  const StudentHistory({super.key});

  @override
  State<StudentHistory> createState() => _StudentHistoryState();
}

class _StudentHistoryState extends State<StudentHistory> {
  late Future<List<Map<String, dynamic>>> _gatePassHistory;

  @override
  void initState() {
    super.initState();
    _gatePassHistory = _fetchGatePassHistory();
  }

  Future<List<Map<String, dynamic>>> _fetchGatePassHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? enNum = prefs.getString('enNum');

    if (enNum == null) {
      throw Exception("Enrollment number not found in SharedPreferences");
    }

    // Fetch data from Firestore based on enrollment number and sort by timestamp
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('requests')
        .where('EN_NUM', isEqualTo: enNum)
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs.map((doc) {
      return {
        'LEAVE_TYPE': doc['LEAVE_TYPE'],
        'DESTI_CITY': doc['DESTI_CITY'],
        'EXIT_DATE': doc['EXIT_DATE'],
        'STATUS': doc['STATUS'],
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.red),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.22,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gate Pass History',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Text(
                          "Review your gatepass requests\nand see their current status",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1,
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: _gatePassHistory,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text(
                            'No gate pass history found.',
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      }

                      List<Map<String, dynamic>> historyList = snapshot.data!;

                      return ListView.builder(
                        itemCount: historyList.length,
                        itemBuilder: (context, index) {
                          var request = historyList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: HistoryCard(
                              leave: request['LEAVE_TYPE'],
                              destination: request['DESTI_CITY'],
                              exitDate: request['EXIT_DATE'],
                              status: request['STATUS'],
                            ),
                          );
                        },
                      );
                    },
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
