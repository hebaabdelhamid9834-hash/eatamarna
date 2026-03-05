import 'package:flutter/material.dart';

class RotatingImage extends StatefulWidget {
  final String imagePath;
  final double width;
  final Duration duration;

  const RotatingImage({
    super.key,
    required this.imagePath,
    required this.width,
    this.duration = const Duration(seconds: 2),
  });

  @override
  _RotatingImageState createState() => _RotatingImageState();
}

class _RotatingImageState extends State<RotatingImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _rotationAnimation =
        Tween<double>(begin: 0.0, end: 2 * 3.14159).animate(_controller)
          ..addListener(() {
            setState(() {});
          });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationY(_rotationAnimation.value),
      alignment: Alignment.center,
      child: Image.asset(
        widget.imagePath,
        width: widget.width,
      ),
    );
  }
}
