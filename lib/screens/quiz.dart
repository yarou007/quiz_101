import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_101/widgets/drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestion = 0;
  int score = 0;
  List<Map<String, dynamic>> quiz = []; // To store fetched questions
  bool isLoading = true; // To show a loading indicator while fetching data

  @override
  void initState() {
    super.initState();
    fetchQuestions(); // Fetch questions when the widget is initialized
  }

  Future<void> fetchQuestions() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('quiz_questions').get();

      // Map Firestore documents to a list of questions
      final fetchedQuestions =
          querySnapshot.docs.map((doc) {
            return {
              "title": doc["title"],
              "answers": List<Map<String, dynamic>>.from(doc["answers"]),
            };
          }).toList();

      setState(() {
        quiz = fetchedQuestions;
        isLoading = false; // Data is loaded
      });
    } catch (e) {
      print("Error fetching questions: $e");
      setState(() {
        isLoading = false; // Stop loading even if there's an error
      });
    }
  }

  // Function to save score to Firestore
  Future<void> saveScore() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await FirebaseFirestore.instance.collection('quiz_scores').add({
          'name': user.email ?? 'Unknown',
          'score': ((score / quiz.length) * 100).round(),
          'date': DateTime.now().toIso8601String(),
        });
        print("Score saved successfully!");
      } else {
        print("No user logged in, cannot save score.");
      }
    } catch (e) {
      print("Error saving score: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body:
          isLoading
              ? Center(
                child: CircularProgressIndicator(),
              ) // Show loading spinner
              : (currentQuestion >= quiz.length)
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Score : ${((score / quiz.length) * 100).round()} % ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await saveScore();
                        setState(() {
                          currentQuestion = 0;
                          score = 0;
                        });
                      },
                      child: Text(
                        "Save & Restart",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ],
                ),
              )
              : ListView(
                children: [
                  ListTile(
                    title: Center(
                      child: Text(
                        "Question ${currentQuestion + 1}/${quiz.length}",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      quiz[currentQuestion]["title"] as String,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ...(quiz[currentQuestion]["answers"]
                          as List<Map<String, dynamic>>)
                      .map((answer) {
                        return ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (answer["correct"] == true) ++score;
                                  ++currentQuestion;
                                });
                              },
                              child: Text(
                                answer["answer"] as String,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
    );
  }
}
