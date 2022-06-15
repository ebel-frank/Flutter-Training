import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      forceElevated: true,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        title: Text("Parallax Effect"),
        background: Image(image: AssetImage("assets/dawn.jpg"), fit: BoxFit.cover,),
      ),
    );
  }
}
