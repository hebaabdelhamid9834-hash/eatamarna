import 'package:flutter/material.dart';

class AnimatedGridView extends StatelessWidget {
  final List<Widget> children;
  final int crossAxisCount;
  final Duration duration;
  final Curve curve;

  const AnimatedGridView({
    super.key,
    required this.children,
    this.crossAxisCount = 2,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) {
        return AnimatedContainer(
          duration: duration,
          curve: curve,
          child: children[index],
        );
      },
    );
  }
}