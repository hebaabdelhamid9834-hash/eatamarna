import 'package:eatamarna/core/utils/extensions/context_extension.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? labelStyle;
  final String labelText;
  final String? initialValue;
  final bool? isObscureText;
  final bool isReadOnly;
  final IconData? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function()? suffixIconTap;
  final IconData? prefixIcon;
  final String? upperText;
  final FontWeight? upperTextFontWeight;
  final Function(String)? onChanged;
  const CustomTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.labelStyle,
    required this.labelText,
    this.initialValue,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.validator,
    this.suffixIconTap,
    this.prefixIcon,
    this.isReadOnly = false,
    this.upperText,
    // this.upperTextColor,
    // this.upperTextFontSize,
    this.upperTextFontWeight,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: isReadOnly,
      controller: controller,
      initialValue: initialValue,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(
              horizontal: context.responsiveWidth(16),
              vertical: context.responsiveHeight(12),
            ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.lightBlue),
              borderRadius: BorderRadius.circular(4.0),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(4.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(4.0),
        ),
        labelStyle: labelStyle ??
            TextStyle(
              color: Colors.grey.shade600,
              fontSize: context.responsiveWidth(14),
            ),

        labelText: labelText,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: suffixIconTap,
                child: Icon(
                  suffixIcon,
                  size: context.responsiveWidth(20),
                  color: Colors.grey.shade600,
                ),
              )
            : null,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: context.responsiveWidth(20),
                color: ColorManager.lightBlue,
              )
            : null,
        fillColor: backgroundColor ?? Colors.white,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      validator: validator ?? (value) => null,
      onChanged: onChanged,
    );
  }
}
