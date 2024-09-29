import 'package:flutter/material.dart';
import 'package:quick_exit/screens/Guard_Screens/IssueGatePass_Views/IssuePassTabBarContent.dart';

class GuardTabBar extends StatelessWidget {
  const GuardTabBar({super.key});

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
          Expanded(
            //TabBar view requires to be within defaultTabController()
            child: IssuePassTabBarContent(),
          )
        ],
      ),
    );
  }
}
