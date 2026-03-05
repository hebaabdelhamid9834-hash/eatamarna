import 'package:flutter/material.dart';

class AnimatedListView extends StatelessWidget {
  final List<Widget> children;
  final Duration duration;
  final Curve curve;

  const AnimatedListView({
    super.key,
    required this.children,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: children.length,
      itemBuilder: (context, index) {
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: duration,
          curve: curve,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, (1 - value) * 20),
                child: child,
              ),
            );
          },
          child: children[index],
        );
      },
    );
  }
}