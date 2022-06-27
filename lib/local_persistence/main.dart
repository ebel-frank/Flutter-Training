import 'package:flutter/material.dart';

import './pages/home.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Persistence',
      theme:
          ThemeData(primarySwatch: Colors.blue, bottomAppBarColor: Colors.blue),
      home: const Home(),
    ));
