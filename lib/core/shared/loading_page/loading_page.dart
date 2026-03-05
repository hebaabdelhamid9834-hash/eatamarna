import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../utils/managers/color_manager/color_manager.dart';

class AnimatedLoader extends StatelessWidget {
  final double size;
  const AnimatedLoader({super.key, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.beat(
        color: ColorManager.lightBlue,
        size: size.r,
      ),
    );
  }
}