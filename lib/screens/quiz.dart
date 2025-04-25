import 'package:flutter/material.dart';
import 'package:quiz_101/widgets/drawer_widget.dart'; // GOOD

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestion = 0;
  var quiz = [
    {
      "title": "Question 1",
      "answers": [
        {"answer": "Answer 11", "correct": false},
        {"answer": "Answer 12", "correct": true},

        {"answer": "Answer 13", "correct": false},
      ],
    },
    {
      "title": "Question 2",
      "answers": [
        {"answer": "Answer 21", "correct": false},
        {"answer": "Answer 22", "correct": true},

        {"answer": "Answer 23", "correct": false},
      ],
    },
    {
      "title": "Question 3",
      "answers": [
        {"answer": "Answer 31", "correct": false},
        {"answer": "Answer 32", "correct": true},

        {"answer": "Answer 33", "correct": false},
      ],
    },
  ];
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body:
          (currentQuestion >= quiz.length)
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
                      onPressed: () {
                        setState(() {
                          currentQuestion = 0;
                          score = 0;
                        });
                      },
                      child: Text("Restart...", style: TextStyle(fontSize: 22)),
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
                          as List<Map<String, Object>>)
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
