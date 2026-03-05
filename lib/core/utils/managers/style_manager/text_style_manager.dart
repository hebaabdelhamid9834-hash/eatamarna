import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color_manager/color_manager.dart';

class TextStyleManager {
  static double adaptiveFontSize(double size) {
    double scaleFactor = ScreenUtil().screenWidth > 600 ? 0.6 : 1.0;
    return (size * scaleFactor).sp;
  }

  // ================ Test Style 10 ================
  static TextStyle style10RegWhite = TextStyle(
    fontSize: adaptiveFontSize(10),
    fontWeight: FontWeight.w400,
    color: ColorManager.white,
  );
  static TextStyle style10BoldWhite = TextStyle(
    fontSize: adaptiveFontSize(10),
    fontWeight: FontWeight.w700,
    color: ColorManager.white,
  );
  static TextStyle style10BoldBlack = TextStyle(
    fontSize: adaptiveFontSize(10),
    fontWeight: FontWeight.w700,
    color: ColorManager.black,
  );

  // ================ Test Style 11 ================

  static TextStyle style11LightWhite = TextStyle(
    fontSize: adaptiveFontSize(11),
    fontWeight: FontWeight.w200,
    color: ColorManager.white,
  );

  // ================ Test Style 12 ================
  static TextStyle style12BoldWhite = TextStyle(
    fontSize: adaptiveFontSize(12),
    fontWeight: FontWeight.w700,
    color: ColorManager.white,
  );
  static TextStyle style12RegWhite = TextStyle(
    fontSize: adaptiveFontSize(12),
    fontWeight: FontWeight.w400,
    color: ColorManager.white,
  );
  static TextStyle style12RegBlack = TextStyle(
    fontSize: adaptiveFontSize(12),
    fontWeight: FontWeight.w400,
    color: ColorManager.black,
  );
  static TextStyle style12BoldBlack = TextStyle(
    fontSize: adaptiveFontSize(12),
    fontWeight: FontWeight.w700,
    color: ColorManager.black,
  );
  static TextStyle style12RegDeepGrey = TextStyle(
    fontSize: adaptiveFontSize(12),
    fontWeight: FontWeight.w400,
    color: const Color(0xff292724),
  );

  // ================ Test Style 13 ================
  static TextStyle style13BoldWhite = TextStyle(
    fontSize: adaptiveFontSize(13),
    fontWeight: FontWeight.w700,
    color: ColorManager.white,
  );

  // ================ Test Style 14 ================

  static TextStyle style14RegBlack = TextStyle(
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w400,
    color: ColorManager.black,
  );
  static TextStyle style14RegWhite = TextStyle(
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w400,
    color: ColorManager.white,
  );
  static TextStyle style14RegGray = TextStyle(
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w400,
    color: Color(0xff9DA3A7),
  );

  static TextStyle style14BoldWhite = TextStyle(
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w700,
    color: ColorManager.white,
  );

  static TextStyle style14BoldBlue = TextStyle(
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w700,
    color: ColorManager.lightBlue,
  );
  static TextStyle style14BoldBlack = TextStyle(
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w700,
    color: ColorManager.black,
  );
  static TextStyle style14SemiBoldDarkBrown = TextStyle(
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w600,
    color: Color(0xff7C4907),
  );
  static TextStyle style14SemiBoldLightBrown = TextStyle(
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w600,
    color: Color(0xffAD7223),
  );

  //============== Test Style 15 ================
  static TextStyle style15RegGray = TextStyle(
    fontSize: adaptiveFontSize(15),
    fontWeight: FontWeight.w500,
    color: Color(0xff727272),
  );
  static TextStyle style15BoldYellow = TextStyle(
    fontSize: adaptiveFontSize(15),
    fontWeight: FontWeight.w700,
    color: ColorManager.yellow,
  );

  // ================ Test Style 16 ================

  static TextStyle style16BoldWhite = TextStyle(
    fontSize: adaptiveFontSize(16),
    fontWeight: FontWeight.w700,
    color: ColorManager.white,
  );
  static TextStyle style16BoldBlack = TextStyle(
    fontSize: adaptiveFontSize(16),
    fontWeight: FontWeight.w700,
    color: ColorManager.black,
  );
  static TextStyle style16SemiBoldBrown = TextStyle(
    fontSize: adaptiveFontSize(16),
    fontWeight: FontWeight.w600,
    color: Color(0xffAF6605),
  );
  static TextStyle style16SemiBoldDarkBrown = TextStyle(
    fontSize: adaptiveFontSize(16),
    fontWeight: FontWeight.w600,
    color: Color(0xff7C4907),
  );
  static TextStyle style16RegWhite = TextStyle(
    fontSize: adaptiveFontSize(16),
    fontWeight: FontWeight.w400,
    color: ColorManager.white,
  );
  static TextStyle style16RegBlack = TextStyle(
    fontSize: adaptiveFontSize(16),
    fontWeight: FontWeight.w400,
    color: ColorManager.black,
  );
  static TextStyle style16LightWhite = TextStyle(
    fontSize: adaptiveFontSize(16),
    fontWeight: FontWeight.w200,
    color: ColorManager.white,
  );
  static TextStyle style16LightBlack = TextStyle(
    fontSize: adaptiveFontSize(16),
    fontWeight: FontWeight.w200,
    color: ColorManager.black,
  );

  // ================ Test Style 18 ================
  static TextStyle style18BoldWhite = TextStyle(
    fontSize: adaptiveFontSize(18),
    fontWeight: FontWeight.w700,
    color: ColorManager.white,
  );
  static TextStyle style18RegWhite = TextStyle(
    fontSize: adaptiveFontSize(18),
    fontWeight: FontWeight.w400,
    color: ColorManager.white,
  );
  static TextStyle style18RegBlack = TextStyle(
    fontSize: adaptiveFontSize(18),
    fontWeight: FontWeight.w400,
    color: ColorManager.black,
  );

  // ================ Test Style 19 ================
  static TextStyle style19RegWhite = TextStyle(
    fontSize: adaptiveFontSize(19),
    fontWeight: FontWeight.w400,
    color: ColorManager.white,
  );

  // ================ Test Style 20 ================
  static TextStyle style20RegWhite = TextStyle(
    fontSize: adaptiveFontSize(20),
    fontWeight: FontWeight.w400,
    color: ColorManager.white,
  );
  static TextStyle style20BoldWhite = TextStyle(
    fontSize: adaptiveFontSize(20),
    fontWeight: FontWeight.w700,
    color: ColorManager.white,
  );

  static TextStyle style22BoldWhite = TextStyle(
    fontSize: adaptiveFontSize(22),
    fontWeight: FontWeight.w700,
    color: ColorManager.white,
  );

  static TextStyle style20BoldBlack = TextStyle(
    fontSize: adaptiveFontSize(20),
    fontWeight: FontWeight.w700,
    color: ColorManager.black,
  );
  static TextStyle style22BoldBlack = TextStyle(
    fontSize: adaptiveFontSize(22),
    fontWeight: FontWeight.w700,
    color: ColorManager.black,
  );

  // ================ Test Style 24 ================
  static TextStyle style24BoldWhite = TextStyle(
    fontSize: adaptiveFontSize(24),
    fontWeight: FontWeight.w700,
    color: ColorManager.white,
  );

  static TextStyle style29BoldBlack = TextStyle(
    fontSize: adaptiveFontSize(29),
    fontWeight: FontWeight.w700,
    color: ColorManager.black,
  );

  static TextStyle style32BoldBlack = TextStyle(
    fontSize: adaptiveFontSize(32),
    fontWeight: FontWeight.w700,
    color: ColorManager.black,
  );
  static TextStyle style14BoldBlackWithWhiteShadow = TextStyle(
    fontSize: adaptiveFontSize(14),
    fontWeight: FontWeight.w700,
    color: ColorManager.black,
    shadows: [
      Shadow(offset: Offset(-0.5, -0.5), color: ColorManager.white),
      Shadow(offset: Offset(0.5, -0.5), color: ColorManager.white),
      Shadow(offset: Offset(0.5, 0.5), color: ColorManager.white),
      Shadow(offset: Offset(-0.5, 0.5), color: ColorManager.white),
    ],
  );
  static TextStyle style16BoldBlackWithWhiteShadow = TextStyle(
    fontWeight: FontWeight.w400,
    color: ColorManager.white,
    shadows: [
      Shadow(
        offset: Offset(-1.0, -1.0), //
        color: ColorManager.black,
      ),
      Shadow(offset: Offset(1.0, -1.0), color: ColorManager.black),
      Shadow(offset: Offset(1.0, 1.0), color: ColorManager.black),
      Shadow(offset: Offset(-1.0, 1.0), color: ColorManager.black),
    ],
  );
}
