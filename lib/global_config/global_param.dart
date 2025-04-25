import 'package:flutter/material.dart';

class GlobalParam {
  static List<Map<String, dynamic>> menus = [
    {
      "title": "Home",
      "icon": Icon(Icons.home, color: Colors.orange),
      "route": "/home_page",
    },
    {
      "title": "Leaderboard",
      "icon": Icon(Icons.camera, color: Colors.orange),
      "route": "/leaderboard",
    },
    {
      "title": "Quiz",
      "icon": Icon(Icons.map, color: Colors.orange),
      "route": "/quiz",
    },
    {
      "title": "Sign out",
      "icon": Icon(Icons.map, color: Colors.orange),
      "route": "/signout",
    },
  ];
}
