import 'package:eatamarna/core/utils/extensions/context_extension.dart';
import 'package:eatamarna/core/utils/managers/assets_manager/image_manager.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/managers/style_manager/text_style_manager.dart';

class PhoneSuffixWidget extends StatelessWidget {
  const PhoneSuffixWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 80.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 1.w,
            height: 20.h,
            color: ColorManager.gray,
          ),
          SizedBox(width: 5.w),
          Text("+965", style: TextStyleManager.style12RegBlack),
          SizedBox(width: 3.w),
          Image.asset(ImageManager.kuFlag, height: 16.h),
        ],
      ),
    );
  }
}
