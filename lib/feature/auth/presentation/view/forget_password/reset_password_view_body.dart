import 'package:eatamarna/core/shared/widgets/main_button.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:eatamarna/core/utils/navigation/navigation_context_extension.dart';
import 'package:eatamarna/feature/auth/data/repo/auth_repository_impl.dart';
import 'package:eatamarna/feature/auth/presentation/manager/forget_password/forget_password_bloc.dart';
import 'package:eatamarna/feature/auth/presentation/manager/forget_password/forget_password_event.dart';
import 'package:eatamarna/feature/auth/presentation/manager/forget_password/forget_password_state.dart';
import 'package:eatamarna/feature/auth/presentation/view/widgets/password_suffix_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/error_handler.dart';
import '../../../../../generated/l10n.dart';

import '../../../../../core/network/api_service.dart';
import '../../../../../core/shared/loading_page/loading_page.dart';
import '../../../../../core/shared/widgets/main_form_field.dart';
import '../../../../../core/shared/widgets/success_dialog.dart';
import '../../../../../core/utils/dependancy_injection/dependancy_injection.dart';
import '../../../../../core/utils/managers/assets_manager/icon_manager.dart';
import '../../../../../core/utils/navigation/router_path.dart';
import '../widgets/auth_appbar.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepositoryImpl(getIt<ApiService>()),
      child: BlocProvider(
        create: (context) =>
            ForgetPasswordBloc(context.read<AuthRepositoryImpl>()),
        child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
          listener: (context,state){
            if(state is SuccessResetPasswordState){
              context.pushReplacementNamed(RouterPath.login);
            }
            if (state is ErrorResetPasswordState) {
              ErrorHandler.showError(context, state.error, () {
                if (context.read<ForgetPasswordBloc>().formKey.currentState!.validate()) {
                  context.read<ForgetPasswordBloc>().add(ResetPasswordEvent());
                }
              });
            }
          },
          builder: (context, state) {
            final bloc = context.read<ForgetPasswordBloc>();
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Form(
                  key: bloc.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthAppbar(
                        title: S.of(context).resetPassword,
                        subTitle: S.of(context).resetPasswordSubtitle,
                      ),
                      SizedBox(height: 30.h),
                      MainFormField(
                        hint: S.of(context).password,
                        prefixIcon: IconManager.lock,
                        suffixIcon: PasswordSuffixWidget(
                          forgotPassword: false,
                          controller: bloc.passwordController,
                          onVisibilityChanged: (isVisible) {
                            bloc.add(PasswordVisibilityEvent());
                          },
                        ),
                        textEditingController: bloc.passwordController,
                        obscureText: !bloc.isPasswordVisible,
                      ),
                      SizedBox(height: 20.h),
                      MainFormField(
                        hint: S.of(context).confirmNewPassword,
                        prefixIcon: IconManager.lock,
                        suffixIcon: PasswordSuffixWidget(
                          forgotPassword: false,
                          controller: bloc.confirmPassword,
                          onVisibilityChanged: (isVisible) {
                            bloc.add(ConfirmPasswordVisibilityEvent());
                          },
                        ),
                        textEditingController: bloc.confirmPassword,
                        obscureText: !bloc.isConfirmPasswordVisible,
                      ),
                      const Spacer(),
                      state is LoadingResetPasswordState
                          ? AnimatedLoader()
                          : MainButton(
                        title: S.of(context).confirmNewPassword,
                        onTap: () {
                          if (bloc.formKey.currentState!.validate()) {
                            // showDialog(
                            //   context: context,
                            //   builder: (context) {
                            //     return SuccessDialog(
                            //       title: S.of(context).operationSuccess,
                            //       subTitle: S.of(context).passChangedSuccess,
                            //     );
                            //   },
                            // );
                            bloc.add(ResetPasswordEvent());
                          }
                        },
                      ),
                    ],
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
