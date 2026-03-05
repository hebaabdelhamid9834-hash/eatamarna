import 'package:eatamarna/core/storage/preference_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/change_lang/localization_cubit.dart';
import 'core/utils/dependancy_injection/dependancy_injection.dart';
import 'eatamarna_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceManager();
  await setupGetIt();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LocalizationCubit())],
      child: const EatamarnaApp(),
    ),
  );
}
