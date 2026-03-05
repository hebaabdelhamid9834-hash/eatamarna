import 'package:eatamarna/core/network/api_service.dart';
import 'package:eatamarna/core/network/tocken_storage_service.dart';
import 'package:eatamarna/core/shared/loading_page/loading_page.dart';
import 'package:eatamarna/core/shared/widgets/main_button.dart';
import 'package:eatamarna/core/storage/preference_manager.dart';
import 'package:eatamarna/core/utils/dependancy_injection/dependancy_injection.dart';
import 'package:eatamarna/core/utils/managers/assets_manager/icon_manager.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:eatamarna/core/utils/navigation/navigation_context_extension.dart';
import 'package:eatamarna/core/utils/navigation/router_path.dart';
import 'package:eatamarna/feature/auth/data/repo/auth_repository_impl.dart';
import 'package:eatamarna/feature/auth/presentation/manager/login/login_bloc.dart';
import 'package:eatamarna/feature/auth/presentation/manager/login/login_event.dart';
import 'package:eatamarna/feature/auth/presentation/manager/login/login_state.dart';
import 'package:eatamarna/feature/auth/presentation/view/widgets/auth_appbar.dart';
import 'package:eatamarna/feature/auth/presentation/view/widgets/phone_suffix_widget.dart';
import 'package:eatamarna/feature/auth/presentation/view/widgets/password_suffix_widget.dart';
import 'package:eatamarna/feature/auth/presentation/view/widgets/remember_widget.dart';
import 'package:eatamarna/feature/home/presentation/view/widgets/custom_text_form_field_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:eatamarna/core/utils/error_handler.dart';
import '../../../../../core/shared/widgets/main_form_field.dart';
import '../../../../../core/utils/managers/style_manager/text_style_manager.dart';
import '../../../../../generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepositoryImpl(getIt<ApiService>()),
      child: BlocProvider(
        create: (context) => LoginBloc(context.read<AuthRepositoryImpl>()),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context,state){
            if(state is SuccessLogInState){
              final token=state.userResponse.accessToken;
              context.pushReplacementNamed(RouterPath.home);
              PreferenceManager().saveSubToken(token!);
              // TokenStorageService().saveToken(token!);
            }
            if (state is ErrorLogInState) {
              ErrorHandler.showError(context, state.error, () {
                context.read<LoginBloc>().add(LogInEvent());
              });
            }
          },
          builder: (context, state) {
            final bloc = context.read<LoginBloc>();
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Form(
                  key: bloc.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuthAppbar(
                          title: S.of(context).login,
                          subTitle: S.of(context).loginSubtitle,
                        ),
                        SizedBox(height: 40.h),
                        PhoneFormField(
                          controller: bloc.phoneController,
                          onCountryCodeChanged: (code) {
                            bloc.phoneCodeController.text = code; // store code in a controller or state
                          },
                        ),
                        SizedBox(height: 30.h),
                        MainFormField(
                          hint: S.of(context).password,
                          prefixIcon: IconManager.lock,
                          textInputType: TextInputType.emailAddress,
                          suffixIcon: PasswordSuffixWidget(
                            controller: bloc.passwordController,
                            onForgotPassword: () {
                              context.pushNamed(RouterPath.forgetPassword);
                            },
                            onVisibilityChanged: (isVisible) {
                              bloc.add(
                                PasswordVisibilityEvent(
                                  passwordVisibility: isVisible,
                                ),
                              );
                            },
                          ),
                          textEditingController: bloc.passwordController,
                          obscureText: !bloc.isPasswordVisible,
                        ),
                        SizedBox(height: 30.h),
                        RememberWidget(
                          reminder: false,
                          onChanged: (value) {
                            bloc.add(ReminderDataEvent(reminderData: value));
                          },
                        ),
                        SizedBox(height: 70.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).noAccountYet,
                              style: TextStyleManager.style14RegBlack,
                            ),
                            SizedBox(width: 2.w),
                            GestureDetector(
                              onTap: () {
                                context.pushNamed(RouterPath.signup);
                              },
                              child: Text(
                                S.of(context).newAccount,
                                style: TextStyleManager.style14BoldWhite
                                    .copyWith(
                                  color: ColorManager.lightBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        state is LoadingLogInState ? AnimatedLoader() :
                        MainButton(
                          title: S.of(context).login,
                          onTap: () {
                            bloc.add(LogInEvent());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
