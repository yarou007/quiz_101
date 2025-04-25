import 'package:flutter/material.dart';
import 'package:quiz_101/screens/leaderboard.page.dart';
import 'package:quiz_101/screens/quiz.dart';

import 'package:quiz_101/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome, do you want to play ?"),
            ElevatedButton(
              onPressed: () {
                // Naviguer vers la page 2 en passant le texte du
                //TextField comme argument
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LeaderboardScreenPage(),
                  ),
                );
              },
              child: Text('Go to quiz page'),
            ),
          ],
        ),
      ),
    );
  }
}
