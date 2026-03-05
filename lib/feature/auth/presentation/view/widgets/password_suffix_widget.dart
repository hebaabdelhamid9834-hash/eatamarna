import 'package:eatamarna/core/utils/extensions/context_extension.dart';
import 'package:eatamarna/core/utils/managers/assets_manager/icon_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/managers/style_manager/text_style_manager.dart';
import '../../../../../generated/l10n.dart';

class PasswordSuffixWidget extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback? onForgotPassword;
  final ValueChanged<bool>? onVisibilityChanged;
  final bool forgotPassword;

  const PasswordSuffixWidget({
    super.key,
    required this.controller,
    this.onForgotPassword,
    this.onVisibilityChanged,
    this.forgotPassword = true,
  });

  @override
  State<PasswordSuffixWidget> createState() => _PasswordSuffixWidgetState();
}

class _PasswordSuffixWidgetState extends State<PasswordSuffixWidget> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.forgotPassword)
          GestureDetector(
            onTap: widget.onForgotPassword,
            child: Text(S.of(context).forgotShort, style: TextStyleManager.style12RegBlack),
          ),
        if (widget.forgotPassword) SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
            widget.onVisibilityChanged?.call(_isPasswordVisible);
          },
          child: SvgPicture.asset(
            _isPasswordVisible ? IconManager.openEye : IconManager.closeEye,
            height: context.responsiveHeight(18),
          ),
        ),
        SizedBox(width: 7.w),
      ],
    );
  }

  bool get isPasswordVisible => _isPasswordVisible;
}
