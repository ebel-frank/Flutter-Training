import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: TextButton(onPressed: () {
          Navigator.pushNamed(context, "/location");
        }, child: const Text("Go to Somewhere")),
      ),),
    );
  }
}
