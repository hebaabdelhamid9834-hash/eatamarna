import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/constants/keys.dart';
import 'core/utils/change_lang/localization_cubit.dart';
import 'core/utils/change_lang/localization_state.dart';
import 'core/utils/navigation/app_router.dart';
import 'core/utils/navigation/router_path.dart';
import 'generated/l10n.dart';

class EatamarnaApp extends StatelessWidget {
  const EatamarnaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (_, child) {
        return BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: Keys.almarai),
              locale: context.read<LocalizationCubit>().getLocale(),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              initialRoute: RouterPath.splash,
              onGenerateRoute: AppRouter().generateRoute,
            );
          },
        );
      },
    );  }
}
