import 'package:eatamarna/core/network/api_service.dart';
import 'package:eatamarna/core/network/tocken_storage_service.dart';
import 'package:eatamarna/core/shared/loading_page/loading_page.dart';
import 'package:eatamarna/core/utils/dependancy_injection/dependancy_injection.dart';
import 'package:eatamarna/core/utils/extensions/context_extension.dart';
import 'package:eatamarna/core/utils/managers/assets_manager/icon_manager.dart';
import 'package:eatamarna/core/utils/managers/assets_manager/image_manager.dart';
import 'package:eatamarna/core/utils/navigation/navigation_context_extension.dart';
import 'package:eatamarna/core/utils/navigation/router_path.dart';
import 'package:eatamarna/feature/auth/data/repo/auth_repository_impl.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_bloc.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_event.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_state.dart';
import 'package:eatamarna/feature/splash/view/widgets/choose_currency_box.dart'
    show ChooseCurrencyBox;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/shared/animations/scale_down_animation.dart';
import '../../../../core/utils/change_lang/localization_cubit.dart';
import '../../../../core/utils/change_lang/localization_state.dart';
import '../../../../core/utils/error_handler.dart';
import '../../../../core/utils/managers/color_manager/color_manager.dart';
import 'choose_lang_box.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  bool _showContainerAndSmallImage = false;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeIn));

    Future.delayed(const Duration(milliseconds: 2800), () {
      if (mounted) {
        setState(() {
          _showContainerAndSmallImage = true;
        });
        _fadeController.forward();
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepositoryImpl(getIt<ApiService>()),
      child: BlocProvider(
        create: (context) => SignUpBloc(isReminder: false, authRepositoryImpl: context.read<AuthRepositoryImpl>()),
        child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) async {
            if (state is SuccessChangeLanguageCurrency) {
             // if (await TokenStorageService().hasToken()) {
             //    context.pushNamed(RouterPath.home);
              // } else {
              //   context.pushNamed(RouterPath.login);
              // }
            }
            if (state is ErrorChangeLanguageCurrency) {
              ErrorHandler.showError(context, state.error, () {
                final prefs = getIt<SharedPreferences>();
                final String language = prefs.getString('locale') ?? "ar";
                final String currency = prefs.getString('selected_currency_name') ?? "KWD";

                context.read<SignUpBloc>().add(ChangeLanguageEvent(
                  language: language,
                  currency: currency,
                ));
              });
            }
          },
            builder: (context, signUpState){
         return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleDownAnimation(
                  child: Image.asset(
                    ImageManager.logo,
                    height: context.responsiveHeight(180),
                  ),
                ),
                if (_showContainerAndSmallImage) ...[
                  FadeTransition(
                      opacity: _fadeAnimation, child: ChooseLangBox()),
                  SizedBox(height: 10.h),
                  // FadeTransition(
                  //     opacity: _fadeAnimation, child: ChooseCurrencyBox()),
                  SizedBox(height: 10.h),
                  signUpState is LoadingChangeLanguageCurrency ? AnimatedLoader() :   FadeTransition(
                    opacity: _fadeAnimation,
                    child: Container(
                      width: context.responsiveWidth(90),
                      height: context.responsiveWidth(90),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorManager.yellow),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          final prefs = getIt<SharedPreferences>();
                          final String language = prefs.getString('locale') ?? "ar";
                          final String currency = prefs.getString('selected_currency_name') ?? "KWD";

                          context.read<SignUpBloc>().add(ChangeLanguageEvent(
                            language: language,
                            currency: currency,
                          ));
                          context.pushNamed(RouterPath.home);

                        },
                        child: Container(
                          margin: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.lightBlue,
                          ),
                          child: FutureBuilder<bool>(
                              future: TokenStorageService().hasToken(),
                              builder: (context, snapshot) {
                                return Center(
                                  child: BlocBuilder<LocalizationCubit, LocalizationState>(
                                    builder: (context, localizationState) {
                                      final isArabic = context
                                          .read<LocalizationCubit>()
                                          .isArabic();

                                      // User requested "add login icon... turned into logout"
                                      // If logged in, show logout icon. If not, maybe show login icon?
                                      // Usually splash screen has a "get started" / arrow.
                                      // But the user specifically asked for login/logout toggle here too.

                                      return
                                      Transform.rotate(
                                        angle: isArabic ? 0 : 3.14159,
                                        child: SvgPicture.asset(
                                          IconManager.arrow,
                                          height: context.responsiveHeight(15),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                          ),
                        ),
                      ),
                    ),
                  ),
                  //   ),
                  //   ),
                ],
              ],
            ),
          );}
        ),
      ),
    );
  }
}
