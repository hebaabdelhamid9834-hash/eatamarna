import 'package:flutter/material.dart';

class SlideInFromBottomAnimation extends StatefulWidget {
  const SlideInFromBottomAnimation({super.key, required this.child});
  final Widget child;
  @override
  State<SlideInFromBottomAnimation> createState() =>
      _SlideInFromBottomAnimationState();
}

class _SlideInFromBottomAnimationState extends State<SlideInFromBottomAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    // Animate the y-axis translation from 100% (off-screen) to 0% (centered)
    _animation = Tween<double>(begin: 1.1, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));
    // Start the animation with a delay
    Future.delayed(const Duration(milliseconds: 100), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Use AnimatedBuilder to translate the container smoothly
          AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Align(
                    alignment: Alignment.center,
                    child: FractionalTranslation(
                      translation: Offset(0.0, _animation.value),
                      child: widget.child,
                    ));
              }),
        ],
      ),
    );
  }
}
