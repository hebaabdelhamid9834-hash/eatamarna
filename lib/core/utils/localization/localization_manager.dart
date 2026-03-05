import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/keys.dart';
import '../dependancy_injection/dependancy_injection.dart';

class LocalizationManager {
  bool isArabic() {
    String? locale = getIt<SharedPreferences>().getString(Keys.locale);
    if (locale != null) {
      return locale == 'ar';
    } else {
      return true;
    }
  }

  Matrix4 flipWidget() {
    return Matrix4.rotationY(!isArabic() ? 3.14159 : 0);
  }
}
