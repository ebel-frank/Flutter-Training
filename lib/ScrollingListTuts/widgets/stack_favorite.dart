import 'package:flutter/material.dart';

class StackFavoriteWidget extends StatelessWidget {
  const StackFavoriteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Image.asset("assets/dawn.jpg"),
            const Positioned(
              top: 0.0,
              right: 0.0,
              child: FractionalTranslation(
                translation: Offset(0.3, -0.3),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white30,
                  child: Icon(
                    Icons.star,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 10.0,
              right: 10.0,
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/siblings.jpg'),
              ),
            ),
            const Positioned(
              bottom: 16,
              left: 16,
              child: Text(
                "Bald Eagle",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white30,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
