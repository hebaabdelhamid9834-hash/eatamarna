import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/keys.dart';
import '../dependancy_injection/dependancy_injection.dart';
import 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());
  String? locale;
  String? appLanguage;
  final sharedPreferences = getIt<SharedPreferences>();

  void changeLanguage(String value) async {
    if (value == "ar") {
      await sharedPreferences.setString(Keys.locale, "ar");
    } else if (value == "en") {
      await sharedPreferences.setString(Keys.locale, "en");
    } else {
      await sharedPreferences.setString(Keys.locale, "tr");
    }
    emit(ChangeLanguage());
  }

  Locale getLocale() {
    final String? locale = sharedPreferences.getString(Keys.locale);
    if (locale != null) {
      if (locale == "en") {
        this.locale = "en";
        appLanguage = "(EN) English";
        return const Locale('en');
      } else if (locale == "tr") {
        this.locale = "tr";
        appLanguage = "(TR) Türkçe";
        return const Locale('tr');
      } else {
        this.locale = "ar";
        appLanguage = "(AR) العربية";
        return const Locale('ar');
      }
    } else {
      this.locale = "ar";
      appLanguage = "(AR) العربية";
      return const Locale('ar');
    }
  }

  isArabic() {
    String? locale = getIt<SharedPreferences>().getString(Keys.locale);
    if (locale != null) {
      return locale == 'ar';
    } else {
      return true;
    }
  }
}
