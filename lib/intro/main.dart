import 'package:flutter/material.dart';
import 'package:training/intro/pages/about.dart';
import 'package:training/intro/pages/gratitude.dart';
import 'package:training/intro/pages/home1.dart';

main() => runApp(MaterialApp(
      title: "Beginning Flutter",
      home: const Home1(),
      routes: {
        '/about': (context) => const About(),
        '/gratitude': (context) => const Gratitude(radioGroupValue: -1),
      },
    ));
