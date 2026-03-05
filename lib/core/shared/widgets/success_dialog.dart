import 'package:eatamarna/core/utils/extensions/context_extension.dart';
import 'package:eatamarna/core/utils/managers/assets_manager/image_manager.dart';
import 'package:eatamarna/core/utils/navigation/navigation_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/managers/color_manager/color_manager.dart';
import '../../utils/managers/style_manager/text_style_manager.dart';
import 'main_button.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String subTitle;

  const SuccessDialog({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xff0F0D23).withOpacity(0.04),
              blurRadius: 54,
              offset: const Offset(10, 24),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageManager.done,
                height: context.responsiveHeight(180),
              ),
              SizedBox(height: 20.h),
              Text(title, style: TextStyleManager.style22BoldBlack),
              SizedBox(height: 20.h),
              Text(subTitle, style: TextStyleManager.style14RegBlack),
              SizedBox(height: 40.h),
              MainButton(
                onTap: () {
                  context.pop();
                },
                title: "حسنا",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
