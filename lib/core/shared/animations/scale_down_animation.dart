import 'package:flutter/material.dart';

class ScaleDownAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final double startScale;
  final double endScale;
  final Curve curve;

  const ScaleDownAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.delay = const Duration(milliseconds: 2000),
    this.startScale = 1.0,
    this.endScale = 0.7,
    this.curve = Curves.easeInOut,
  });

  @override
  State<ScaleDownAnimation> createState() => _ScaleDownAnimationState();
}

class _ScaleDownAnimationState extends State<ScaleDownAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: widget.startScale,
      end: widget.endScale,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    // بدء التأثير بعد التأخير المحدد
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: widget.child,
        );
      },
    );
  }
}
