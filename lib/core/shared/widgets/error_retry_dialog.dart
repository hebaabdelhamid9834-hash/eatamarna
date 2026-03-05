import 'package:eatamarna/core/utils/extensions/context_extension.dart';
import 'package:eatamarna/core/utils/navigation/navigation_context_extension.dart';
import 'package:eatamarna/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/managers/color_manager/color_manager.dart';
import '../../utils/managers/style_manager/text_style_manager.dart';
import 'main_button.dart';

class ErrorRetryDialog extends StatelessWidget {
  final String error;
  final VoidCallback onTryAgain;

  const ErrorRetryDialog({super.key, required this.error, required this.onTryAgain});

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
                  color: ColorManager.red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.error_outline_rounded,
                  size: 80.w,
                  color: ColorManager.red,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                S.of(context).unexpectedError,
                style: TextStyleManager.style22BoldBlack,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Text(
                error,
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
