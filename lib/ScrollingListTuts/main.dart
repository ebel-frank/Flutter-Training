import 'package:flutter/material.dart';


import './pages/grid.dart';
import './pages/grid2.dart';
import './pages/home.dart';
import './pages/stack.dart';
import './pages/custom_scroll_view.dart';

void main() => runApp(const MaterialApp(
      // home: Home(),
      // home: GridPage(),
      // home: GridBuilder(),
      // home: StackView(),
      home: CustomScrollViewSliver(),
    ));
