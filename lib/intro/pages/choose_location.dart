import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {
    // simulate network request for a username
    await Future.delayed(Duration(seconds: 3), () {
      print("Frank Ebeledike");
    });

    print("Statement");
  }

  Future<String> getYears() async {
    return "Test";
  }

  @override
  void initState() {
    super.initState();
    getData();
    getYears().then((value) => print(value*2));
    print("Done");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a Location"),
      ),
      body: Text("data"),
    );
  }
}
