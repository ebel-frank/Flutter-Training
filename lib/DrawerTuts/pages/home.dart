import 'package:flutter/material.dart';
import 'package:training/DrawerTuts/widget/left_drawer.dart';
import 'package:training/DrawerTuts/widget/right_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Tutorial"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 8.0,
              margin: const EdgeInsets.all(14.0),
              shape: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.deepOrange.withOpacity(0.5))),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: const [
                    Text(
                      "Travel Plans",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 48.0,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      "OutlineInputBorder",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            // Card 2
            Card(
              elevation: 8.0,
              margin: const EdgeInsets.all(14.0),
              shape: StadiumBorder(),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: const [
                    Text(
                      "Travel Plans",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 48.0,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      "StadiumBorder",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            // Default Card 3
            Card(
              elevation: 8.0,
              margin: const EdgeInsets.all(14.0),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: const [
                    Text(
                      "Travel Plans",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 48.0,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      "Default",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            // Card 4
            Card(
              elevation: 8.0,
              margin: const EdgeInsets.all(14.0),
              shape: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange)),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: const [
                    Text(
                      "Travel Plans",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 48.0,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      "UnderlineInputBorder",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.flight),
                title: Text('Arik Airlines'),
                subtitle: Text('Seat 30 Available'),
                trailing: Icon(Icons.bookmark),
                onTap: () {},
              ),
            ),
            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('Toyota Car'),
              subtitle: Text('Cool Product'),
              trailing: Icon(Icons.bookmark),
              onTap: () {},
            )
          ],
        ),
      ),
      drawer: const LeftDrawerWidget(),
      endDrawer: const RightDrawerWidget(),
    );
  }
}
