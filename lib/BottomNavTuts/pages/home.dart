import 'package:flutter/material.dart';
import 'package:training/BottomNavTuts/pages/gratitude.dart';
import 'package:training/BottomNavTuts/pages/birthday.dart';
import 'package:training/BottomNavTuts/pages/reminders.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List _listPages = [];
  bool checkValue = false;

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();

    _listPages
      ..add(const Birthday())
      ..add(const Gratitude())
      ..add(const Reminders());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          Checkbox(
            value: checkValue,
            onChanged: (value) {
              setState(() {
                checkValue = !checkValue;
              });
            },

          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: _listPages[_currentIndex],
        ),
      ),
      floatingActionButtonLocation: checkValue ? FloatingActionButtonLocation.endDocked : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: checkValue ? BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.blue.shade200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.cake), color: Colors.white,),
            IconButton(onPressed: () {}, icon: Icon(Icons.sentiment_satisfied), color: Colors.white,),
            IconButton(onPressed: () {}, icon: Icon(Icons.access_alarm), color: Colors.white,),
            Divider(),
          ],
        ),
      )
          : BottomNavigationBar(
        onTap: (selectedIndex) => _changePage(selectedIndex),
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: "Birthday",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied),
            label: "Gratitude",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: "Reminders",
          ),
        ],
      ),
    );
  }
}
