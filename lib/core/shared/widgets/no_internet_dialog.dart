import 'package:eatamarna/core/utils/extensions/context_extension.dart';
import 'package:eatamarna/core/utils/navigation/navigation_context_extension.dart';
import 'package:eatamarna/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/managers/color_manager/color_manager.dart';
import '../../utils/managers/style_manager/text_style_manager.dart';
import 'main_button.dart';

class NoInternetDialog extends StatelessWidget {
  final VoidCallback onTryAgain;

  const NoInternetDialog({super.key, required this.onTryAgain});

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
              color: const Color(0xff0F0D23).withOpacity(0.04),
              blurRadius: 54,
              offset: const Offset(10, 24),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: ColorManager.lightBlue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.wifi_off_rounded,
                  size: 80.w,
                  color: ColorManager.lightBlue,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                S.of(context).noInternetConnection,
                style: TextStyleManager.style22BoldBlack,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Text(
                S.of(context).unexpectedError, // Or a more specific check-your-connection message if available
                style: TextStyleManager.style14RegBlack,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              MainButton(
                onTap: () {
                  context.pop();
                  onTryAgain();
                },
                title: S.of(context).tryAgain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
