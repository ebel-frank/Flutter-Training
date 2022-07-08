import 'package:flutter/material.dart';

class MoodIcons {
  final List<MoodIcon> _moodIconsList = <MoodIcon>[
    MoodIcon(
        title: 'Very Satisfied',
        color: Colors.amber,
        rotation: 0.4,
        icon: Icons.sentiment_very_satisfied),
    MoodIcon(
        title: 'Satisfied',
        color: Colors.green,
        rotation: 0.2,
        icon: Icons.sentiment_satisfied),
    MoodIcon(
        title: 'Neutral',
        color: Colors.grey,
        rotation: 0.0,
        icon: Icons.sentiment_neutral),
    MoodIcon(
        title: 'Dissatisfied',
        color: Colors.cyan,
        rotation: -0.2,
        icon: Icons.sentiment_dissatisfied),
    MoodIcon(
        title: 'Very Dissatisfied',
        color: Colors.red,
        rotation: -0.4,
        icon: Icons.sentiment_very_dissatisfied),
  ];

  IconData getMoodIcon(String mood) {
    return _moodIconsList[
            _moodIconsList.indexWhere((icon) => icon.title == mood)]
        .icon;
  }

  Color getMoodColor(String mood) {
    return _moodIconsList[
            _moodIconsList.indexWhere((icon) => icon.title == mood)]
        .color;
  }

  double getMoodRotation(String mood) {
    return _moodIconsList[
            _moodIconsList.indexWhere((icon) => icon.title == mood)]
        .rotation;
  }

  List<MoodIcon> getMoodIconList() {
    return _moodIconsList;
  }
}

class MoodIcon {
  final String title;
  final Color color;
  final double rotation;
  final IconData icon;

  MoodIcon(
      {required this.title,
      required this.color,
      required this.rotation,
      required this.icon});
}
