import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/dawn.jpg"),
        const Positioned(
          bottom: 10.0,
          left: 10.0,
          child: CircleAvatar(
            radius: 40.0,
            backgroundImage: AssetImage("assets/siblings.jpg"),
          ),
        ),
        const Positioned(
          bottom: 16.0,
          right: 16.0,
          child: Text(
            "Lion",
            style: TextStyle(
                fontSize: 32.0,
                color: Colors.white30,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
