import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_101/reusable_widgets/reusable_widget.dart';
import 'package:quiz_101/screens/home_screen.dart';
import 'package:quiz_101/utils/color_utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignupScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();

  bool _isValidPassword = false;

  bool _validatePassword(String password) {
    // Vérifiez si le mot de passe satisfait les critères
    return _isValidPassword =
        password.length >= 8 &&
        password.contains(RegExp(r'\d')) &&
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("5BA3C2"),
              hexStringToColor("91BAA2"),
              hexStringToColor("EDDD53"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.2,
              20,
              0,
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter username",
                  Icons.person_2_sharp,
                  false,
                  _usernameTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter Email",
                  Icons.email,
                  false,
                  _emailTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter password",
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                ),
                SignInSignUpButton(context, false, () {
                  if (_validateEmail(_emailTextController.text) &&
                      _validatePassword(_passwordTextController.text)) {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text,
                        )
                        .then((value) {
                          print("Created new account");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        })
                        .onError((error, stacktrace) {
                          if (error is FirebaseAuthException) {
                            if (error.code == 'email-already-in-use') {
                              _showDialog(
                                context,
                                'Cet email est déjà utilisé par un autre compte.',
                                Icons.error,
                                Colors.red,
                              );
                            } else if (error.code == 'invalid-email') {
                              _showDialog(
                                context,
                                'Adresse email invalide.',
                                Icons.error,
                                Colors.red,
                              );
                            } else {
                              _showDialog(
                                context,
                                'Erreur : ${error.message}',
                                Icons.error,
                                Colors.red,
                              );
                            }
                          } else {
                            _showDialog(
                              context,
                              'Une erreur est survenue.',
                              Icons.error,
                              Colors.red,
                            );
                          }
                        });
                  } else {
                    _showDialog(
                      context,
                      'Failed to register , enter a valid email or password',
                      Icons.error,
                      Colors.red,
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showDialog(
  BuildContext context,
  String message,
  IconData icon,
  Color iconColor,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          children: [
            Icon(icon, color: iconColor),
            SizedBox(width: 8),
            Text('Message'),
          ],
        ),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
