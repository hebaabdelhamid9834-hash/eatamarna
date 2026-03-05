import 'package:flutter/material.dart';

class SlidingfromTopTransition extends StatefulWidget {
  final Duration duration;
  final Offset startOffset;
  final int? delay;
  final Widget child;
  final AnimationController? controller;

  const SlidingfromTopTransition({
    super.key,
    this.duration = const Duration(milliseconds: 500),
    this.startOffset = const Offset(0.2, -1), // من اليمين والأعلى
    this.delay,
    required this.child,
    this.controller,
  });

  @override
  State<SlidingfromTopTransition> createState() =>
      _SlidingfromTopTransitionState();
}

class _SlidingfromTopTransitionState extends State<SlidingfromTopTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = widget.controller ??
        AnimationController(
          duration: widget.duration,
          vsync: this,
        );

    _offsetAnimation = Tween<Offset>(
      begin: widget.startOffset,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack, // يعطي إحساس القفزة ثم الرجوع
      ),
    );

    Future.delayed(Duration(milliseconds: widget.delay ?? 0), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _animationController.dispose(); // فقط لو داخلي
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }
}
