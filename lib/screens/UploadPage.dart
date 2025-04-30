import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadPage extends StatelessWidget {
  Future<void> uploadQuiz() async {
    List<Map<String, dynamic>> questions = [
      {
        "title": "Which keyword is used to inherit a class in Java?",
        "answers": [
          {"answer": "implement", "correct": false},
          {"answer": "extends", "correct": true},
          {"answer": "inherits", "correct": false},
          {"answer": "override", "correct": false},
        ],
      },
      {
        "title": "Which data type is used to store a single character in Java?",
        "answers": [
          {"answer": "String", "correct": false},
          {"answer": "char", "correct": true},
          {"answer": "character", "correct": false},
          {"answer": "int", "correct": false},
        ],
      },
      {
        "title": "Which method is called when an object is created?",
        "answers": [
          {"answer": "finalize()", "correct": false},
          {"answer": "static()", "correct": false},
          {"answer": "constructor", "correct": true},
          {"answer": "destructor", "correct": false},
        ],
      },
      {
        "title": "Which of the following is not an OOP concept in Java?",
        "answers": [
          {"answer": "Inheritance", "correct": false},
          {"answer": "Polymorphism", "correct": false},
          {"answer": "Compilation", "correct": true},
          {"answer": "Encapsulation", "correct": false},
        ],
      },
      {
        "title": "What is the default value of a boolean variable in Java?",
        "answers": [
          {"answer": "true", "correct": false},
          {"answer": "false", "correct": true},
        ],
      },
      {
        "title":
            "Which interface provides the capability to store objects using a key-value pair?",
        "answers": [
          {"answer": "List", "correct": false},
          {"answer": "Map", "correct": true},
          {"answer": "Set", "correct": false},
          {"answer": "Collection", "correct": false},
        ],
      },
      {
        "title": "Which package contains the Random class?",
        "answers": [
          {"answer": "java.util", "correct": true},
          {"answer": "java.random", "correct": false},
          {"answer": "java.lang", "correct": false},
          {"answer": "java.io", "correct": false},
        ],
      },
      {
        "title": "Which keyword is used to prevent method overriding?",
        "answers": [
          {"answer": "static", "correct": false},
          {"answer": "private", "correct": false},
          {"answer": "final", "correct": true},
          {"answer": "constant", "correct": false},
        ],
      },
      {
        "title": "What is the size of int in Java?",
        "answers": [
          {"answer": "4 bytes", "correct": true},
          {"answer": "2 bytes", "correct": false},
          {"answer": "8 bytes", "correct": false},
          {"answer": "Depends on system", "correct": false},
        ],
      },
      {
        "title": "What is the superclass of all Java classes?",
        "answers": [
          {"answer": "String", "correct": false},
          {"answer": "Object", "correct": true},
          {"answer": "Class", "correct": false},
          {"answer": "Component", "correct": false},
        ],
      },
      {
        "title": "Which keyword is used to define an abstract class?",
        "answers": [
          {"answer": "interface", "correct": false},
          {"answer": "abstract", "correct": true},
          {"answer": "extends", "correct": false},
          {"answer": "implements", "correct": false},
        ],
      },
      {
        "title": "Which of these is a marker interface?",
        "answers": [
          {"answer": "Cloneable", "correct": false},
          {"answer": "Remote", "correct": false},
          {"answer": "Serializable", "correct": true},
          {"answer": "Comparable", "correct": false},
        ],
      },
      {
        "title": "Which exception is thrown when a thread is interrupted?",
        "answers": [
          {"answer": "IOException", "correct": false},
          {"answer": "SQLException", "correct": false},
          {"answer": "InterruptedException", "correct": true},
          {"answer": "TimeoutException", "correct": false},
        ],
      },
      {
        "title": "What will happen if the main() method is declared private?",
        "answers": [
          {"answer": "Compile successfully", "correct": true},
          {"answer": "Runtime Error", "correct": false},
          {"answer": "Compile time Error", "correct": false},
          {"answer": "Program runs normally", "correct": false},
        ],
      },
      {
        "title": "Which class can be used to create a thread by extending it?",
        "answers": [
          {"answer": "Runnable", "correct": false},
          {"answer": "Thread", "correct": true},
          {"answer": "Executors", "correct": false},
          {"answer": "Callable", "correct": false},
        ],
      },
      {
        "title": "What does JVM stand for?",
        "answers": [
          {"answer": "Java Visual Machine", "correct": false},
          {"answer": "Java Virtual Machine", "correct": true},
          {"answer": "Java Version Manager", "correct": false},
          {"answer": "Java Verification Machine", "correct": false},
        ],
      },
      {
        "title": "Which of the following is not a feature of Java?",
        "answers": [
          {"answer": "Object-Oriented", "correct": false},
          {"answer": "Portable", "correct": false},
          {"answer": "Pointers", "correct": true},
          {"answer": "Robust", "correct": false},
        ],
      },
      {
        "title": "Which collection is synchronized?",
        "answers": [
          {"answer": "ArrayList", "correct": false},
          {"answer": "HashMap", "correct": false},
          {"answer": "Vector", "correct": true},
          {"answer": "HashSet", "correct": false},
        ],
      },
      {
        "title": "Which exception is a checked exception?",
        "answers": [
          {"answer": "RuntimeException", "correct": false},
          {"answer": "IOException", "correct": true},
          {"answer": "NullPointerException", "correct": false},
          {"answer": "IndexOutOfBoundsException", "correct": false},
        ],
      },
      {
        "title":
            "Which operator is used by Java to allocate memory for an object?",
        "answers": [
          {"answer": "malloc", "correct": false},
          {"answer": "alloc", "correct": false},
          {"answer": "new", "correct": true},
          {"answer": "create", "correct": false},
        ],
      },
      {
        "title": "What does JEE stand for?",
        "answers": [
          {"answer": "Java Embedded Edition", "correct": false},
          {"answer": "Java Extended Edition", "correct": false},
          {"answer": "Java Enterprise Edition", "correct": true},
          {"answer": "Java Edition Enterprise", "correct": false},
        ],
      },
      {
        "title": "Which API is used for database connectivity in Java EE?",
        "answers": [
          {"answer": "JDBC", "correct": true},
          {"answer": "Hibernate", "correct": false},
          {"answer": "JPA", "correct": false},
          {"answer": "EJB", "correct": false},
        ],
      },
      {
        "title": "What is the default scope of a Servlet?",
        "answers": [
          {"answer": "Singleton", "correct": true},
          {"answer": "Prototype", "correct": false},
          {"answer": "Request", "correct": false},
          {"answer": "Session", "correct": false},
        ],
      },
      {
        "title": "Which annotation is used to declare a Servlet 3.0?",
        "answers": [
          {"answer": "@WebServlet", "correct": true},
          {"answer": "@Servlet", "correct": false},
          {"answer": "@Controller", "correct": false},
          {"answer": "@WebService", "correct": false},
        ],
      },
      {
        "title": "Which of the following is NOT a part of JEE?",
        "answers": [
          {"answer": "JPA", "correct": false},
          {"answer": "EJB", "correct": false},
          {"answer": "Swing", "correct": true},
          {"answer": "JSP", "correct": false},
        ],
      },
      {
        "title": "Which JEE component is responsible for business logic?",
        "answers": [
          {"answer": "Servlet", "correct": false},
          {"answer": "EJB", "correct": true},
          {"answer": "JSP", "correct": false},
          {"answer": "JSF", "correct": false},
        ],
      },
      {
        "title": "Which protocol is used by default in web applications?",
        "answers": [
          {"answer": "TCP", "correct": false},
          {"answer": "HTTP", "correct": true},
          {"answer": "FTP", "correct": false},
          {"answer": "SMTP", "correct": false},
        ],
      },
      {
        "title": "Which is used for dependency injection in Java EE?",
        "answers": [
          {"answer": "EJB", "correct": false},
          {"answer": "JPA", "correct": false},
          {"answer": "CDI", "correct": true},
          {"answer": "JMS", "correct": false},
        ],
      },
      {
        "title": "Which API is used for sending emails in Java EE?",
        "answers": [
          {"answer": "JavaMail API", "correct": true},
          {"answer": "Java Messaging API", "correct": false},
          {"answer": "JavaMail Sender", "correct": false},
          {"answer": "Java Email Protocol", "correct": false},
        ],
      },
      {
        "title": "In JSP, which directive is used to import packages?",
        "answers": [
          {"answer": "<%@ page import=\"...\" %>", "correct": true},
          {"answer": "<%@ include file=\"...\" %>", "correct": false},
          {"answer": "<jsp:useBean>", "correct": false},
          {"answer": "<%@ taglib %>", "correct": false},
        ],
      },
    ];

    for (var question in questions) {
      await FirebaseFirestore.instance
          .collection('quiz_questions')
          .add(question);
    }

    print("✅ Questions uploaded successfully!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Quiz')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await uploadQuiz();
          },
          child: Text("Upload Quiz Questions"),
        ),
      ),
    );
  }
}
