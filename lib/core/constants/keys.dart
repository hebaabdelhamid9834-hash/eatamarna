import 'package:eatamarna/core/storage/preference_manager.dart';

class Keys {
  static const String almarai = 'Almarai';
  static const String locale = "locale";
  static const String token = "token";
  static const String fcmToken = "fcmToken";
  static const String isLoggedIn = "isLoggedIn";
  static const String isRegister = "isRegister";
}
bool get isEn => PreferenceManager().currentLang() == 'en';

