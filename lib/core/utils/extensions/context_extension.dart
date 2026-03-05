import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../change_lang/localization_cubit.dart';

extension Context on BuildContext {
  get height => MediaQuery.sizeOf(this).height;

  get width => MediaQuery.sizeOf(this).width;

  get isTablet => width > 600;
  static const double _designHeight = 932;
  static const double _designWidth = 430;

  get _localizationCubit => BlocProvider.of<LocalizationCubit>(this);

  get isArabic => _localizationCubit.isArabic();

  double responsiveWidth(double widgetWidth) {
    return width * (widgetWidth / _designWidth);
  }

  double responsiveHeight(double widgetHeight) {
    return height * (widgetHeight / _designHeight);
  }
}
