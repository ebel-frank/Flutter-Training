import 'package:flutter/material.dart';
import 'package:training/BottomNavTuts/pages/gratitude.dart';
import 'package:training/BottomNavTuts/pages/reminders.dart';

class Birthday extends StatefulWidget {
  const Birthday({Key? key}) : super(key: key);

  @override
  State<Birthday> createState() => _BirthdayState();
}

class _BirthdayState extends State<Birthday>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  void _tabChanged() {
    // Check if Tab Controller index is changing, otherwise we get the notice twice
    if (_tabController.indexIsChanging) {
      print('tabChanged: ${_tabController.index}');
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_tabChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(text: "Gratitude",),
          Tab(text: "Reminders",),
        ],
        labelColor: Colors.black54,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
      ),
      body: SafeArea(
          child: TabBarView(
        children: const [
          Gratitude(info: "Gratitude Page in Birthday Page"),
          Reminders(info: "Reminders Page in Birthday Page"),
        ],
        controller: _tabController,
      )),
    );
  }
}
