import 'package:flutter/material.dart';

class AnimatedBalloonWidget extends StatefulWidget {
  const AnimatedBalloonWidget({Key? key}) : super(key: key);

  @override
  _AnimatedBalloonWidgetState createState() => _AnimatedBalloonWidgetState();
}

class _AnimatedBalloonWidgetState extends State<AnimatedBalloonWidget>
    with TickerProviderStateMixin {
  late AnimationController _controllerFloatUp;
  late AnimationController _controllerGrowSize;
  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();
    _controllerFloatUp =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    _controllerGrowSize =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
  }

  @override
  void dispose() {
    _controllerFloatUp.dispose();
    _controllerGrowSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _balloonHeight = MediaQuery.of(context).size.width / 2.1;
    double _balloonWidth = MediaQuery.of(context).size.width / 3;
    double _balloonBottomLocation =
        MediaQuery.of(context).size.height - _balloonHeight;

    _animationFloatUp = Tween(begin: _balloonBottomLocation, end: 0.0).animate(
        CurvedAnimation(
            parent: _controllerFloatUp, curve: Curves.fastOutSlowIn));
    _animationGrowSize = Tween(begin: 50.0, end: _balloonWidth).animate(
        CurvedAnimation(parent: _controllerGrowSize, curve: Curves.elasticOut));

    _controllerFloatUp.forward();
    _controllerGrowSize.forward();

    return Center(
      child: AnimatedBuilder(
        animation: _animationFloatUp,
        builder: (context, child) {
          return Container(
            child: child,
            margin: EdgeInsets.only(top: _animationFloatUp.value),
            width: _animationGrowSize.value,
            height: _animationGrowSize.value,
          );
        },
        child: GestureDetector(
          onTap: () {
            if (_controllerFloatUp.isCompleted) {
              _controllerFloatUp.reverse();
              _controllerGrowSize.reverse();
            } else {
              _controllerFloatUp.forward();
              _controllerGrowSize.forward();
            }
          },
          child: Image.asset("assets/siblings.jpg",
              height: _balloonHeight, width: _balloonWidth),
        ),
      ),
    );
  }
}

class StaggeredAnimatedBalloonWidget extends StatefulWidget {
  const StaggeredAnimatedBalloonWidget({Key? key}) : super(key: key);

  @override
  _StaggeredAnimatedBalloonWidgetState createState() =>
      _StaggeredAnimatedBalloonWidgetState();
}

class _StaggeredAnimatedBalloonWidgetState
    extends State<StaggeredAnimatedBalloonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _balloonHeight = MediaQuery.of(context).size.height / 4.5;
    double _balloonWidth = MediaQuery.of(context).size.height / 3;
    double _balloonBottomLocation = MediaQuery.of(context).size.height - _balloonHeight;

    _animationFloatUp = Tween(begin: _balloonBottomLocation, end: 0.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 1.0, curve: Curves.fastOutSlowIn)));

    _animationGrowSize = Tween(begin: 50.0, end: _balloonWidth).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.5, curve: Curves.elasticOut)));

    return Center(
      child: AnimatedBuilder(
        animation: _animationFloatUp,
        builder: (context, child) {
          return Container(
            color: Colors.black,
            child: child,
            margin: EdgeInsets.only(top: _animationFloatUp.value),
            width: _animationGrowSize.value,
            height: _animationGrowSize.value,
          );
        },
        child: GestureDetector(
          onTap: () {
            if (_controller.isCompleted) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: Image.asset("assets/siblings.jpg",
              height: _balloonHeight, width: _balloonWidth),
        ),
      ),
    );
  }
}
