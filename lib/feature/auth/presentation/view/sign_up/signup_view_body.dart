import 'package:eatamarna/core/shared/loading_page/loading_page.dart';
import 'package:eatamarna/core/shared/widgets/main_button.dart';
import 'package:eatamarna/core/utils/navigation/navigation_context_extension.dart';
import 'package:eatamarna/feature/auth/data/repo/auth_repository_impl.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_bloc.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_event.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_state.dart';
import 'package:eatamarna/feature/auth/presentation/view/terms_condition_screen.dart';
import 'package:eatamarna/feature/auth/presentation/view/widgets/password_suffix_widget.dart';
import 'package:eatamarna/feature/auth/presentation/view/widgets/phone_suffix_widget.dart';
import 'package:eatamarna/feature/auth/presentation/view/widgets/remember_widget.dart';
import 'package:eatamarna/feature/home/presentation/view/widgets/custom_text_form_field_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/network/api_service.dart';
import '../../../../../core/shared/widgets/main_form_field.dart';
import '../../../../../core/utils/dependancy_injection/dependancy_injection.dart';
import '../../../../../core/utils/managers/assets_manager/icon_manager.dart';
import '../../../../../core/utils/managers/color_manager/color_manager.dart';
import '../../../../../core/utils/managers/style_manager/text_style_manager.dart';
import '../../../../../core/utils/navigation/router_path.dart';
import '../../../../../core/utils/error_handler.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/auth_appbar.dart';

class SignupViewBody extends StatelessWidget {
  bool reminder;
   SignupViewBody({super.key, required this. reminder});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepositoryImpl(getIt<ApiService>()),
    child: BlocProvider(
  create: (context) => SignUpBloc(isReminder:reminder,authRepositoryImpl: context.read<AuthRepositoryImpl>()),
  child: BlocConsumer<SignUpBloc, SignUpState>(
    listener: (context,state){
      if(state is SuccessSignupState){
        context.pushNamed(RouterPath.login);
      }
      if (state is ErrorSignupState) {
        ErrorHandler.showError(context, state.error, () {
          context.read<SignUpBloc>().add(SignupEvent());
        });
      }
    },
  builder: (context, state) {
    final bloc=context.read<SignUpBloc>();
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Form(
              key: bloc.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthAppbar(
                      title: S.of(context).newAccount,
                      subTitle: S.of(context).signUpSubtitle,
                    ),
                    SizedBox(height: 40.h),
                    MainFormField(
                      hint: S.of(context).firstName,
                      prefixIcon: IconManager.nameIcon,
                      textEditingController: bloc.fNameController,
                    ),
                    SizedBox(height: 20.h),
                    MainFormField(
                      hint: S.of(context).surname,
                      prefixIcon: IconManager.nameIcon,
                      textEditingController: bloc.lNameController,
                    ),
                    SizedBox(height: 20.h),
                    MainFormField(
                      hint: S.of(context).email,
                      prefixIcon: IconManager.emailIcon,
                      textEditingController: bloc.emailController,
                    ),
                    SizedBox(height: 20.h),
                    PhoneFormField(
                      controller: bloc.phoneController,
                      onChanged: (value) {
                       // fullPhone = value; // +201234567890
                      },
                      onCountryCodeChanged: (code) {
                        bloc.countryCode= code; // store code in a controller or state
                      },
                    ),
                    SizedBox(height: 20.h),
                    MainFormField(
                      hint: S.of(context).password,
                      prefixIcon: IconManager.lock,
                      suffixIcon: PasswordSuffixWidget(
                        forgotPassword: false,
                        controller: bloc.passwordController,
                        onVisibilityChanged: (isVisible) {
                        bloc.add(PasswordVisibilityEvent(passwordVisibility: isVisible));
                        },
                      ),
                      textEditingController: bloc.passwordController,
                      obscureText: !bloc.isPasswordVisible,
                    ),
                    SizedBox(height: 30.h),
                    RememberWidget(
                      reminder:bloc.isRemembered,
                      widget: Row(
                        children: [
                          Text(
                            S.of(context).iReadAndAccept,
                            style: TextStyleManager.style14RegBlack,
                          ),
                          SizedBox(width: 2.w),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsConditionScreen()));
                            },
                            child: Text(
                              S.of(context).termsPrivacy,
                              style: TextStyleManager.style14BoldWhite.copyWith(
                                color: ColorManager.lightBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onChanged: (value) {
                        bloc.add(ReminderDataEvent(reminderData: value));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          state is LoadingSignupState?SliverToBoxAdapter(child: AnimatedLoader()):
              state is ErrorSignupState?
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 20.w,
                  ),
                  child: MainButton(
                    title: S.of(context).createAccount,
                    onTap: () {
                      bloc.add(SignupEvent());
                    },
                  ),
                ),
                Text(state.error,style: TextStyle(color: ColorManager.red),)
              ],
            ),
          ):
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 20.w,
                  ),
                  child: MainButton(
                    title: S.of(context).createAccount,
                    onTap: () {
bloc.add(SignupEvent());
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
),
),
);
  }
}
