import 'package:flutter/material.dart';
import 'package:training/ScrollingListTuts/widgets/sliver_app_bar.dart';
import 'package:training/ScrollingListTuts/widgets/sliver_grid.dart';
import 'package:training/ScrollingListTuts/widgets/sliver_list.dart';

class CustomScrollViewSliver extends StatelessWidget {
  const CustomScrollViewSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: const CustomScrollView(
        slivers: [
          SliverAppBarWidget(),
          SliverListWidget(),
          SliverGridWidget(),
        ],
      ),
    );
  }
}
