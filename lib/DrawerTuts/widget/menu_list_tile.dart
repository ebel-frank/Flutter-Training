import 'package:flutter/material.dart';
import 'package:training/DrawerTuts/pages/birthday.dart';
import 'package:training/DrawerTuts/pages/gratitude.dart';
import 'package:training/DrawerTuts/pages/reminders.dart';

class MenuListTileWidget extends StatefulWidget {
  const MenuListTileWidget({Key? key}) : super(key: key);

  @override
  _MenuListTileWidgetState createState() => _MenuListTileWidgetState();
}

class _MenuListTileWidgetState extends State<MenuListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.cake),
          title: const Text("Birthdays"),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Birthday()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.sentiment_satisfied),
          title: const Text("Gratitude"),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Gratitude()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.alarm),
          title: const Text("Reminders"),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Reminders()));
          },
        ),
        const Divider(color: Colors.grey),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Setting"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
