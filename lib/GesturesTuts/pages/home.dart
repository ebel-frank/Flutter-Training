import 'dart:developer';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _gestureDetected = "";
  Color _paintedColor = Colors.white54;

  void _displayGestureDetected(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestures, Drag & Drop"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Build Gesture Detector
              GestureDetector(
                onTap: () {
                  log("onTap");
                  _displayGestureDetected('onTap');
                },
                onDoubleTap: () {
                  log("onDoubleTap");
                  _displayGestureDetected('onDoubleTap');
                },
                onLongPress: () {
                  log("onLongPress");
                  _displayGestureDetected('onLongPress');
                },
                /*onPanUpdate: (DragUpdateDetails details) {
                  log("onPanUpdate: $details");
                  _displayGestureDetected('onPanUpdate:\n$details');
                },*/
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  log("onVerticalDragUpdate: $details");
                  _displayGestureDetected('onVerticalDragUpdate:\n$details');
                },
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  log("onHorizontalDragUpdate: $details");
                  _displayGestureDetected('onHorizontalDragUpdate:\n$details');
                },
                child: Container(
                  color: Colors.lightGreen.shade100,
                  padding: const EdgeInsets.all(24),
                  width: double.infinity,
                  child: Column(
                    children: [
                      const Icon(Icons.access_alarm, size: 98),
                      Text(_gestureDetected)
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                height: 44,
              ),
              // Build Draggable
              Draggable(
                child: Column(
                  children: const [
                    Icon(
                      Icons.palette,
                      color: Colors.deepOrange,
                      size: 48,
                    ),
                    Text("Drag me below to change color")
                  ],
                ),
                childWhenDragging: const Icon(
                  Icons.palette,
                  color: Colors.grey,
                  size: 48,
                ),
                feedback: const Icon(
                  Icons.brush,
                  color: Colors.deepOrange,
                  size: 80,
                ),
                data: Colors.deepOrange.value,
              ),
              const Divider(
                height: 40,
              ),
              // Build Drag Target
              DragTarget<int>(
                onAccept: (colorValue) {
                  _paintedColor = Color(colorValue);
                },
                builder: (BuildContext context,
                        List<int?> acceptedData /*candidateData*/,
                        List<dynamic> rejectedData) =>
                    acceptedData.isEmpty
                        ? Text(
                            "Drag to and see color change",
                            style: TextStyle(color: _paintedColor),
                          )
                        : Text(
                            "Painting Color: $acceptedData",
                            style: TextStyle(
                                color: Color(acceptedData[0]!),
                                fontWeight: FontWeight.bold),
                          ),
              ),
              const Divider(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
