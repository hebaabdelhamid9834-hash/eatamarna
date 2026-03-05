import 'package:eatamarna/core/utils/navigation/navigation_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../generated/l10n.dart';

import '../../../../../core/utils/managers/color_manager/color_manager.dart';
import '../../../../../core/utils/managers/style_manager/text_style_manager.dart';
import '../../../../../core/utils/navigation/router_path.dart';

class AuthAppbar extends StatelessWidget {
  final String title;
  final String? subTitle;

  const AuthAppbar({super.key, required this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Icon(Icons.arrow_back_ios),
                ),
                Text(title, style: TextStyleManager.style16BoldBlack),
                const Spacer(),
                const ShipContainer(),
              ],
            ),
            SizedBox(height: 10.h),
            Text(subTitle!, style: TextStyleManager.style15RegGray),
          ],
        ),
      ],
    );
  }
}

class ShipContainer extends StatelessWidget {
  const ShipContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushReplacementNamed(RouterPath.home),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(5.r),
          border: Border.all(color: ColorManager.lightBlue),
        ),
        child: Center(
          child: Text(
            S.of(context).skip,
            style: TextStyleManager.style12BoldWhite.copyWith(
              color: ColorManager.lightBlue,
            ),
          ),
        ),
      ),
    );
  }
}
