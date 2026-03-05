import 'package:eatamarna/core/utils/extensions/context_extension.dart';
import 'package:eatamarna/core/utils/managers/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/managers/color_manager/color_manager.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isLoading;

  const MainButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: context.responsiveHeight(60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: ColorManager.lightBlue,
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(color: ColorManager.white)
              : Text(title, style: TextStyleManager.style20BoldWhite),
        ),
      ),
    );
  }
}
