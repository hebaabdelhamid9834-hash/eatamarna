import 'dart:async';
import 'package:eatamarna/core/network/api_service.dart';
import 'package:eatamarna/core/shared/loading_page/loading_page.dart';
import 'package:eatamarna/core/utils/dependancy_injection/dependancy_injection.dart';
import 'package:eatamarna/core/utils/managers/style_manager/text_style_manager.dart';
import 'package:eatamarna/core/utils/navigation/navigation_context_extension.dart';
import 'package:eatamarna/core/utils/navigation/router_path.dart';
import 'package:eatamarna/feature/auth/data/repo/auth_repository_impl.dart';
import 'package:eatamarna/feature/auth/presentation/manager/forget_password/forget_password_bloc.dart';
import 'package:eatamarna/feature/auth/presentation/manager/forget_password/forget_password_event.dart';
import 'package:eatamarna/feature/auth/presentation/manager/forget_password/forget_password_state.dart';
import 'package:eatamarna/feature/auth/presentation/view/widgets/auth_appbar.dart';
import 'package:eatamarna/feature/auth/presentation/view/widgets/otp_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/error_handler.dart';
import '../../../../../generated/l10n.dart';

import '../../../../../core/constants/keys.dart';
import '../../../../../core/shared/widgets/main_button.dart';
import '../../../../../core/utils/managers/color_manager/color_manager.dart';

class OtpViewBody extends StatefulWidget {
  final String email;
  const OtpViewBody({super.key,required this.email});

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  int _secondsRemaining = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final minutes = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  bool get _isResendEnabled => _secondsRemaining == 0;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepositoryImpl(getIt<ApiService>()),
      child: BlocProvider(
        create: (context) =>
            ForgetPasswordBloc(context.read<AuthRepositoryImpl>()),
        child:
        BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
          listener: (context,state){
if(state is SuccessSendCodeState){
  context.pushNamed(RouterPath.resetPassword);

}
            if (state is ErrorSendCodeState) {
              ErrorHandler.showError(context, state.error, () {
                context.read<ForgetPasswordBloc>().add(SendCodeEvent());
              });
            }
          },
          builder: (context, state) {
            final bloc = context.read<ForgetPasswordBloc>();
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthAppbar(
                      title: S.of(context).verification,
                      subTitle: S.of(context).otpSubtitle,
                    ),
                    SizedBox(height: 20.h),
                    Text(widget.email,
                        style: TextStyleManager.style15BoldYellow),
                    SizedBox(height: 40.h),
                    OtpInputWidget(
                      onChanged: (otp) {
                        bloc.codeController.text = otp;
                        print("OTP: $otp");
                      },
                      onCompleted: (otp) {
                        bloc.codeController.text = otp;
                        print("OTP Completed: $otp");
                      },
                    ),
                    SizedBox(height: 40.h),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: S.of(context).codeExpiresIn,
                              style: TextStyleManager.style14RegBlack.copyWith(
                                fontFamily: Keys.almarai,
                              ),
                            ),
                            TextSpan(
                              text: _formattedTime,
                              style: TextStyleManager.style15BoldYellow
                                  .copyWith(
                                fontFamily: Keys.almarai,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Text(
                            S.of(context).didNotReceiveCode,
                            style: TextStyleManager.style14RegBlack,
                          ),
                        SizedBox(width: 2.w),
                        GestureDetector(
                          onTap: _isResendEnabled
                              ? () {
                            _startTimer();
                            bloc.add(ResendCodeEvent());
                          }
                              : null,
                          child: Text(
                            S.of(context).resend,
                            style: TextStyleManager.style14BoldWhite.copyWith(
                              color: _isResendEnabled
                                  ? ColorManager.lightBlue
                                  : ColorManager.gray,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    state is LoadingSendCodeState ? AnimatedLoader() :
                    MainButton(
                      title: S.of(context).confirmCode,
                      onTap: () {
                        bloc.add(SendCodeEvent());
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
