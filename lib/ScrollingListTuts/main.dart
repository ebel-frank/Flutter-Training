import 'package:flutter/material.dart';


import '../ScrollingListTuts/pages/grid.dart';
import '../ScrollingListTuts/pages/grid2.dart';
import '../ScrollingListTuts/pages/home.dart';
import '../ScrollingListTuts/pages/stack.dart';
import '../ScrollingListTuts/pages/custom_scroll_view.dart';

void main() => runApp(const MaterialApp(
      // home: Home(),
      // home: GridPage(),
      // home: GridBuilder(),
      // home: StackView(),
      home: CustomScrollViewSliver(),
    ));
