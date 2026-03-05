import 'package:flutter/material.dart';

class DropBounceAnimation extends StatefulWidget {
  const DropBounceAnimation({
    super.key,
    required this.child,
    this.delay = 0,
    this.duration,
    this.offset,
  });

  final Widget child;
  final int? delay; // delay in *hundreds* of milliseconds
  final int? duration; // total animation duration in milliseconds
  final double? offset; // how far it starts above (default: -2)

  @override
  State<DropBounceAnimation> createState() => _DropBounceAnimationState();
}

class _DropBounceAnimationState extends State<DropBounceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration ?? 1000),
    );

    _animation = Tween<Offset>(
      begin: Offset(0, widget.offset ?? -2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

    Future.delayed(Duration(milliseconds: widget.delay! * 100), () {
      if (mounted) _controller.forward();
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.dispose();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation, child: widget.child);
  }
}
