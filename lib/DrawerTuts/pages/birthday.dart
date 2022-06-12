import 'package:flutter/material.dart';
import 'package:training/BottomNavTuts/pages/gratitude.dart';
import 'package:training/BottomNavTuts/pages/reminders.dart';

class Birthday extends StatelessWidget {
  const Birthday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Birthdays"),
      ),
      body: const SafeArea(
          child: Center(
        child: Icon(Icons.cake, size: 120.0, color: Colors.orange),
      )),
    );
  }
}
