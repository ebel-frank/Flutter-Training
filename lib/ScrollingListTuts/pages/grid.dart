import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {
  const GridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView - Playground"),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.all(8.0),
        children: List.generate(20, (index) {
          return Card(
            shadowColor: Colors.lightGreen,
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark_border, size: 48.0, color: Colors.blue,),
                  Divider(),
                  Text("Index $index", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0),)
                ],
              ),
              onTap: () {
                print("Row $index");
              },
              splashColor: Colors.lightGreen,
            ),
          );
        }),
      ),
    );
  }
}
