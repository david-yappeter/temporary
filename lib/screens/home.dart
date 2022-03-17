import 'package:flutter/material.dart';

import 'package:tugas_2/screens/profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Center(
          child: TextButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            icon: const Icon(Icons.person, color: Colors.white),
            label: const Text('Profile', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.routeName);
            },
          ),
        ));
  }
}
