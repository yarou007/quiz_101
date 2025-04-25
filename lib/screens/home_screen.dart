import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_101/screens/home.page.dart';
import 'package:quiz_101/screens/leaderboard.page.dart';
import 'package:quiz_101/screens/quiz.dart';
import 'package:quiz_101/screens/signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _currentScreen = HomePage(); // default screen
  String _currentTitle = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_currentTitle)),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                FirebaseAuth.instance.currentUser?.email ?? 'No email',
              ),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/me.jpg"),
                radius: 80,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pinkAccent, Colors.orangeAccent],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.orange),
              title: Text("Home"),
              onTap: () {
                setState(() {
                  _currentScreen = HomePage();
                });
                Navigator.of(context).pop(); // close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.leaderboard, color: Colors.orange),
              title: Text("Leaderboard"),
              onTap: () {
                setState(() {
                  _currentTitle = "Leaderboard";
                  _currentScreen = LeaderboardScreenPage();
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.quiz, color: Colors.orange),
              title: Text("Quiz page"),
              onTap: () {
                setState(() {
                  _currentTitle = "Quiz";

                  _currentScreen = Quiz();
                });
                Navigator.of(context).pop();
              },
            ),

            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.orange),
              title: Text("Sign out"),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SigninScreen()),
                  );
                });
              },
            ),
          ],
        ),
      ),
      body: _currentScreen,
    );
  }

  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Logout"),
          onPressed:
              () => FirebaseAuth.instance.signOut().then(
                (value) => {
                  print("Signed out"),
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SigninScreen()),
                  ),
                },
              ),
        ),
      ),
    );
  }*/
}
