import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../network/api_service.dart';
import '../local_storage_manager/shared_prefrences_helper.dart';
import '../localization/localization_manager.dart';
import '../networking/api_service.dart';

final getIt = GetIt.instance;

setupGetIt() async {
  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerSingleton<SharedPrefsHelper>(
    SharedPrefsHelper(sharedPreferences: getIt<SharedPreferences>()),
  );

  //======================== DioHelper =========================
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());
  getIt.registerSingletonAsync<ApiService>(
        () async => await ApiService.create(),
  );


  //======================== Localization =========================
  getIt.registerSingleton<LocalizationManager>(LocalizationManager());

  //======================== splash repo =========================
  await getIt.allReady();
}
