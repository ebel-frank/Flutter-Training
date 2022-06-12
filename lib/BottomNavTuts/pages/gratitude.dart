import 'package:flutter/material.dart';

class Gratitude extends StatelessWidget {
  final String info;
  const Gratitude({Key? key, this.info = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.sentiment_satisfied,
              size: 120.0,
              color: Colors.lightGreen,
            ),
            Text(info, style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
