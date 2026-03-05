import 'package:flutter/material.dart';

class ScalingTransition extends StatefulWidget {
  final Duration duration;
  final double startScale;
  final int? delay;
  final Widget child;
  final AnimationController? controller;

  const ScalingTransition({
    super.key,
    this.duration = const Duration(milliseconds: 400),
    this.startScale = 0.3,
    this.delay,
    required this.child,
    this.controller,
  });

  @override
  State<ScalingTransition> createState() => _ScalingTransitionState();
}

class _ScalingTransitionState extends State<ScalingTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // إنشاء controller محلي إذا لم يتم توفير واحد
    _animationController = widget.controller ?? AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: widget.startScale,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    // بدء الـ animation بعد التأخير المحدد
    Future.delayed(Duration(milliseconds: widget.delay ?? 0), () {
      if (mounted) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    // dispose فقط إذا كان controller محلي
    if (widget.controller == null) {
      _animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}