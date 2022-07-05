import 'package:flutter/material.dart';

import 'pages/login.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Journal',
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          canvasColor: Colors.lightGreen.shade50,
          bottomAppBarColor: Colors.lightGreen),
      home: const Login(),
    ));
