import 'package:eatamarna/core/storage/secure_storage.dart';
import 'package:get_storage/get_storage.dart';

import 'caching_keys.dart';

class PreferenceManager {
  final GetStorage _box = GetStorage();
 // bool isLoggedIn() => currentUser() != null;

 // // void saveUser(UserData userData, {bool? isLogin}) {
 //   // if (isLogin == true) {
 //      // if (userData.deviceId != null) _saveDeviceID(userData.deviceId!);
 //      // SecureStorageController.saveAuthToken(userData.token!);
 //   // }
 //    if (userData.user != null) {
 //      _box.write(CachingKey.USER, userData.user!.toJson());
 //    } else {
 //      // Optional: log or handle the null user case
 //      print('Warning: Tried to save null user');
 //    }
 //    // _box.write(CachingKey.USER, userData.user!.toJson());
 //  }

  // User? currentUser() =>
  //     _box.read(CachingKey.USER) == null
  //         ? null
  //         : User.fromJson(GetStorage().read(CachingKey.USER));

  void saveDeviceID(int deviceId) =>
      _box.write(CachingKey.DEVICE_ID, deviceId);

  int deviceID() => _box.read(CachingKey.DEVICE_ID) as int? ?? 1;
  void saveBookingCode(String deviceId) =>
      _box.write(CachingKey.bookingCode, deviceId);

  String getBookingCode() => _box.read(CachingKey.bookingCode) as String? ?? "";

  void saveLanguage(String lang) => _box.write(CachingKey.LANGUAGE, lang);
  String getSubToken() => _box.read(CachingKey.sub_token) as String? ?? "";

  void saveSubToken(String subToken) => _box.write(CachingKey.sub_token, subToken);

  String currentLang() => _box.read(CachingKey.LANGUAGE) as String? ?? "ar";
  void deleteToken() async {
    await _box.remove(CachingKey.sub_token);
  }
  void logout() {
    String lang = currentLang();
    _box.erase();
    saveLanguage(lang);
    SecureStorageController.deleteAll();
  }
}
