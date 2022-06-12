import 'package:flutter/material.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  String _howAreYou = "...";

  // Obsolete
  /*void _openPageAbout(
      {required BuildContext context, bool fullScreenDialog = false}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: fullScreenDialog,
            builder: (context) => const About()));
  }*/

  void _openPageAbout(
      {required BuildContext context, bool fullScreenDialog = false}) {
    Navigator.pushNamed(context, "/about");
  }

  // Obsolete
  /*void _openPageGratitude(
      {required BuildContext context, bool fullScreenDialog = false}) async {
    final String? _gratitudeResponse = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const Gratitude(radioGroupValue: -1)));
    setState(() {
      _howAreYou = _gratitudeResponse ?? "Nothing";
    });
  }*/

  void _openPageGratitude(
      {required BuildContext context, bool fullScreenDialog = false}) async {
    var _gratitudeResponse =
        await Navigator.pushNamed(context, "/gratitude");
    setState(() {
      if (_gratitudeResponse != null && _gratitudeResponse.runtimeType == String) {
        _howAreYou = _gratitudeResponse.toString();
      } else {
        _howAreYou = "Nothing";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator Tutorial"),
        actions: [
          IconButton(
              onPressed: () {
                _openPageAbout(context: context, fullScreenDialog: true);
              },
              icon: const Icon(Icons.info_outline))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Grateful for: $_howAreYou",
                  style: const TextStyle(fontSize: 32.0),
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/about");
                },
                child: const Hero(
                    tag: 'format_paint',
                    child: Icon(
                      Icons.format_paint,
                      color: Colors.lightGreen,
                      size: 120.0,
                    )),
              ),
              const Text("Click to see Hero Animation")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openPageGratitude(context: context, fullScreenDialog: true);
        },
        tooltip: "About",
        child: const Icon(Icons.sentiment_satisfied),
      ),
    );
  }
}
