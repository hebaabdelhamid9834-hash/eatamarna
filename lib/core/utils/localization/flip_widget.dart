import 'package:flutter/material.dart';

import '../dependancy_injection/dependancy_injection.dart';
import 'localization_manager.dart';

class FlipWidget extends StatelessWidget {
  const FlipWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: getIt<LocalizationManager>().flipWidget(),
      child: child,
    );
  }
}
