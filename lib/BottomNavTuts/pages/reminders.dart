import 'package:flutter/material.dart';

class Reminders extends StatelessWidget {
  final String info;
  const Reminders({Key? key, this.info = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.access_alarm,
              size: 120.0,
              color: Colors.purple,
            ),
            Text(info, style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
