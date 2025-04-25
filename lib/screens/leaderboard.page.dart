import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';

class LeaderboardScreenPage extends StatelessWidget {
  const LeaderboardScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "LEADERBOARD",
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  }
}
