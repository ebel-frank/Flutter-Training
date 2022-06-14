import 'package:flutter/material.dart';

import '../widgets/stackW.dart';
import '../widgets/stack_favorite.dart';

class StackView extends StatelessWidget {
  const StackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Tuts"),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 7, itemBuilder: (BuildContext context, int index) {
              if (index.isEven) {
                return const StackWidget();
              } else {
                return const StackFavoriteWidget();
              }
        }),
      ),
    );
  }
}
