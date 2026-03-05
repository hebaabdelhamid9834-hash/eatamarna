import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:eatamarna/core/utils/managers/style_manager/text_style_manager.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainFormField extends StatelessWidget {
  final String hint;
  final bool isSuffixIcon;
  final Widget? suffixIcon;
  final String prefixIcon;
  final TextEditingController textEditingController;
  final bool obscureText;
  final TextInputType? textInputType;

  const MainFormField({
    super.key,
    required this.hint,
    this.isSuffixIcon = true,
    this.suffixIcon,
    required this.prefixIcon,
    required this.textEditingController,
    this.obscureText = false,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).field_required;
        }
        return null;
      },
      controller: textEditingController,
      textInputAction: TextInputAction.done,
      keyboardType: textInputType,
      obscureText: obscureText,
      cursorColor: ColorManager.black,
      style: TextStyleManager.style16RegBlack,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(prefixIcon),
        ),
        suffixIcon: isSuffixIcon == true ? suffixIcon : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        labelText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.auto,

        labelStyle: TextStyleManager.style12RegBlack.copyWith(
          color: const Color(0xff9F9F9F),
        ),
        errorStyle: TextStyleManager.style12RegBlack.copyWith(
          color: Colors.red,
        ),
        floatingLabelStyle: TextStyleManager.style12RegBlack.copyWith(
          color:ColorManager.lightBlue,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorManager.gray),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.lightBlue),
          borderRadius: BorderRadius.circular(4),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
