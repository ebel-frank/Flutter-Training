import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Journal",
          style: TextStyle(color: Colors.lightGreen.shade800),
        ),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          child: Container(),
          preferredSize: const Size.fromHeight(32),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.lightGreen, Colors.lightGreen.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.lightGreen.shade800,
            ),
            onPressed: () {
              // TODO: Add signOut method
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add _addOrEditJournal method
        },
        tooltip: 'Add Journal Entry',
        backgroundColor: Colors.lightGreen.shade300,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.lightGreen.shade50, Colors.lightGreen],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          height: 44,
        ),
      ),
    );
  }
}
