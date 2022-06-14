import 'package:flutter/material.dart';
import 'package:training/ScrollingListTuts/widgets/grid_icons.dart';

class GridBuilder extends StatelessWidget {
  const GridBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> _iconList = GridIcons().getIconList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView.Builder - Tuts"),
      ),
      body: SafeArea(
        // GridView.builder does lazy loading
        child: GridView.builder(
            itemCount: 51,
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150),
            itemBuilder: (BuildContext context, int index) {
              print('_buildGridViewBuilder $index');

              return Card(
                color: Colors.lightGreen.shade50,
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Column(
                    children: [
                      Icon(
                        _iconList[index % 20],
                        size: 48.0,
                        color: Colors.lightGreen,
                      ),
                      const Divider(),
                      Text(
                        "Index $index",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16.0),
                      )
                    ],
                  ),
                  onTap: () {
                    print('Row $index');
                  },
                ),
              );
            }),
      ),
    );
  }
}
