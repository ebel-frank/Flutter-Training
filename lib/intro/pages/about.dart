import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.shortestSide / 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Hero(
            tag: 'format_paint',
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Icon(
                Icons.format_paint,
                color: Colors.lightGreen,
                size: _width,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
