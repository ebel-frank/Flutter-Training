import 'package:flutter/material.dart';

class Gratitude extends StatefulWidget {
  final int radioGroupValue;

  const Gratitude({required this.radioGroupValue, Key? key}) : super(key: key);

  @override
  State<Gratitude> createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  final List<String> _gratitudeList = [];
  late String _selectedGratitude;
  late int _radioGroupValue;

  void _radioOnChanged(int index) {
    setState(() {
      _radioGroupValue = index;
      _selectedGratitude = _gratitudeList[index];
      print("_selectedRadioValue $_selectedGratitude");
    });
  }

  @override
  void initState() {
    super.initState();

    _gratitudeList..add("Family")..add("Friends")..add("Coffee");
    _radioGroupValue = widget.radioGroupValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gratitude"),
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context, _selectedGratitude),
              icon: const Icon(Icons.check))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              Radio(
                  value: 0,
                  groupValue: _radioGroupValue,
                  onChanged: (index) => _radioOnChanged(int.parse(index.toString()))),
              const Text("Family"),
              Radio(
                  value: 1,
                  groupValue: _radioGroupValue,
                  onChanged: (index) => _radioOnChanged(int.parse(index.toString()))),
              const Text("Friends"),
              Radio(value: 2,
                  groupValue: _radioGroupValue,
                  onChanged: (index) => _radioOnChanged(int.parse(index.toString()))),
              const Text("Coffee"),
            ],
          ),
        ),
      ),
    );
  }
}
