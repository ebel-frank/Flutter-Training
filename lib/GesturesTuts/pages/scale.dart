import 'dart:developer';

import 'package:flutter/material.dart';

class GestureScale extends StatefulWidget {
  const GestureScale({Key? key}) : super(key: key);

  @override
  State<GestureScale> createState() => _GestureScaleState();
}

class _GestureScaleState extends State<GestureScale> {
  Offset _startLastOffset = Offset.zero;
  Offset _lastOffset = Offset.zero;
  Offset _currentOffset = Offset.zero;
  double _lastScale = 1.0;
  double _currentScale = 1.0;

  void _setScaleSmall() {
    setState(() {
      _currentScale = 0.5;
    });
  }

  void _setScaleBig() {
    setState(() {
      _currentScale = 16;
    });
  }

  void _onLongPress() {
    _resetToDefaultValues();
  }

  void _resetToDefaultValues() {
    _startLastOffset = Offset.zero;
    _lastOffset = Offset.zero;
    _currentOffset = Offset.zero;
    _lastScale = 1.0;
    _currentScale = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onScaleStart: (ScaleStartDetails details) {
            log("ScaleStartDetails: $details");

            _startLastOffset = details.focalPoint;
            _lastOffset = _currentOffset;
            _lastScale = _currentScale;
          },
          onScaleUpdate: (ScaleUpdateDetails details) {
            log('Scale: ${details.scale}');

            if (details.scale != 1.0) {
              // Scaling
              double currentScale = _lastScale * details.scale;
              if (currentScale < 0.5) {
                currentScale = 0.5;
              }
              setState(() {
                _currentScale = currentScale;
              });
              log("_scale: $_currentScale - _lastScale: $_lastScale");
            } else if (details.scale == 1.0) {
              Offset offsetAdjustedForScale = (_startLastOffset - _lastOffset) / _lastScale;
              Offset currentOffset = details.focalPoint - (offsetAdjustedForScale * _currentScale);
              setState(() {
                _currentOffset = currentOffset;
              });
              log('offsetAdjustedForScale: $offsetAdjustedForScale - _currentOffset: $_currentOffset');
            }
          },
          onDoubleTap: () {
            log("onDoubleTap");

            // Calculate current scale and populate the _lastScale with currentScale if
            // currentScale is greater than 16 times the original image, reset scale to default, 1.0
            double currentScale = _lastScale * 2.0;
            if (currentScale > 16) {
              currentScale = 1.0;
              // reset to default values
              _resetToDefaultValues();
            }
            _lastScale = currentScale;

            setState(() {
              _currentScale = currentScale;
            });
          },
          onLongPress: () {
            log("onLongPress");
            setState(() {
              // reset to default values
              _resetToDefaultValues();
            });
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Transform Scale and Translate
              Transform.scale(
                scale: _currentScale,
                child: Transform.translate(
                  offset: _currentOffset,
                  child: const Image(
                    image: AssetImage("assets/oceans.jpg"),
                  ),
                ),
              ),
              // Transform Matrix4
              /*Transform(transform: Matrix4.identity()
                ..scale(_currentScale, _currentScale)
                ..translate(_currentOffset.dx, _currentOffset.dy),
              alignment: FractionalOffset.center,
              child: const Image(
                image: AssetImage("assets/oceans.jpg"),
              ),),*/
              // Positioned StatusBar
              Positioned(
                top: 0,
                  // width: double.infinity,  using this throws an error: BoxConstraints forces an infinite width.
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    color: Colors.white54,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Scale: ${_currentScale.toStringAsFixed(4)}',
                        ),
                        Text(
                          'Current: $_currentOffset',
                        ),
                      ],
                    ),
                  )
              ),
              // Positioned InkWell and InkResponse
              Positioned(
                top: 50,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  color: Colors.white54,
                  height: 56.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: Container(
                          height: 48,
                          width: 128,
                          color: Colors.black12,
                          child: Icon(
                            Icons.touch_app,
                            size: 32,
                          ),
                        ),
                        splashColor: Colors.lightGreenAccent,
                        highlightColor: Colors.lightBlueAccent,
                        onTap: _setScaleSmall,
                        onDoubleTap: _setScaleBig,
                        onLongPress: _onLongPress,
                      ),
                      InkResponse(
                        child: Container(
                          height: 48,
                          width: 128,
                          color: Colors.black12,
                          child: Icon(
                            Icons.touch_app,
                            size: 32,
                          ),
                        ),
                        splashColor: Colors.lightGreenAccent,
                        highlightColor: Colors.lightBlueAccent,
                        onTap: _setScaleSmall,
                        onDoubleTap: _setScaleBig,
                        onLongPress: _onLongPress, // not working
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
