import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_101/global_config/global_param.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.orangeAccent],
              ),
            ),
            accountEmail: Text(user?.email ?? 'Guest'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/me.jpg"),
            ),
            accountName: null,
          ),
          ...(GlobalParam.menus).map((item) {
            return ListTile(
              title: Text('${item['title']}', style: TextStyle(fontSize: 26)),
              leading: item['icon'],
              trailing: Icon(Icons.arrow_right, color: Colors.orange),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '${item['route']}');
              },
            );
          }),
        ],
      ),
    );
  }
}
