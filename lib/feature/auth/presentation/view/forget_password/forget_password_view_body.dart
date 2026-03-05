import 'package:eatamarna/core/network/api_service.dart';
import 'package:eatamarna/core/shared/loading_page/loading_page.dart';
import 'package:eatamarna/core/shared/widgets/main_button.dart';
import 'package:eatamarna/core/shared/widgets/main_form_field.dart';
import 'package:eatamarna/core/utils/dependancy_injection/dependancy_injection.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:eatamarna/core/utils/navigation/navigation_context_extension.dart';
import 'package:eatamarna/feature/auth/data/repo/auth_repository_impl.dart';
import 'package:eatamarna/feature/auth/presentation/manager/forget_password/forget_password_bloc.dart';
import 'package:eatamarna/feature/auth/presentation/manager/forget_password/forget_password_event.dart';
import 'package:eatamarna/feature/auth/presentation/manager/forget_password/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/error_handler.dart';
import '../../../../../core/utils/managers/assets_manager/icon_manager.dart';
import '../../../../../core/utils/navigation/router_path.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/auth_appbar.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepositoryImpl(getIt<ApiService>()),
      child: BlocProvider(
        create: (context) =>
            ForgetPasswordBloc(context.read<AuthRepositoryImpl>()),
        child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
          listener: (context,state){
            if(state is SuccessForgetPasswordState){
              context.pushReplacementNamed(RouterPath.otp,arguments: {
                "email":context.read<ForgetPasswordBloc>().emailController.text
              });
            }
            if (state is ErrorForgetPasswordState) {
              ErrorHandler.showError(context, state.error, () {
                context.read<ForgetPasswordBloc>().add(ForgetPasswordByEmailEvent());
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
                        title: S.of(context).forgetPassword,
                        subTitle: S.of(context).forgotPassSubtitle,
                      ),
                      SizedBox(height: 40.h),
                      MainFormField(
                        hint: S.of(context).email,
                        prefixIcon: IconManager.emailIcon,
                        textEditingController: bloc.emailController,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 40.h),
                      state is LoadingForgetPasswordState ? AnimatedLoader() :
                      MainButton(
                        title: S.of(context).sendCode,
                        onTap: () {
                          bloc.add(ForgetPasswordByEmailEvent());
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
