import 'package:bloc/bloc.dart';
import 'package:eatamarna/feature/auth/data/repo/auth_repository_impl.dart';
import 'package:flutter/material.dart';

import 'forget_password_event.dart';
import 'forget_password_state.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc(this.authRepositoryImpl) : super(InitialState()){
    on<ForgetPasswordByEmailEvent>(forgetPassword);
    on<SendCodeEvent>(sendCode);
    on<ResendCodeEvent>(reSendCode);
    on<ResetPasswordEvent>(resetPassword);
    on<PasswordVisibilityEvent>(_passwordVisibility);
    on<ConfirmPasswordVisibilityEvent>(_confirmPasswordVisibility);

  }
  final AuthRepositoryImpl authRepositoryImpl;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController codeController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPassword =TextEditingController();
  bool isRemembered=false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  _passwordVisibility(PasswordVisibilityEvent event,Emitter<ForgetPasswordState>emit){
    isPasswordVisible=event.passwordVisibility;
    emit(PasswordVisibilityState());
  }
  _confirmPasswordVisibility(ConfirmPasswordVisibilityEvent event,Emitter<ForgetPasswordState>emit){
    isConfirmPasswordVisible=event.passwordVisibility;
    emit(PasswordVisibilityState());
  }
  forgetPassword(ForgetPasswordByEmailEvent event,Emitter<ForgetPasswordState>emit)async{
    if(!formKey.currentState!.validate())return;
    emit(LoadingForgetPasswordState());
    final result=await authRepositoryImpl.forgetPassword(email: emailController.text);
    result.fold((failure){
      emit(ErrorForgetPasswordState(error: failure.errorMessage));
    },(result){
      emit(SuccessForgetPasswordState());
      // context.pushNamed(RouterPath.otp);

    });
  }
  sendCode(SendCodeEvent event,Emitter<ForgetPasswordState>emit)async{
    emit(LoadingSendCodeState());
    final result=await authRepositoryImpl.sendCode(email: emailController.text,code:codeController.text );
    result.fold((failure){
      emit(ErrorSendCodeState(error: failure.errorMessage));
    },(result){
      emit(SuccessSendCodeState());
      // context.pushNamed(RouterPath.otp);

    });
  }
  reSendCode(ResendCodeEvent event,Emitter<ForgetPasswordState>emit)async{
    emit(LoadingResendCodeState());
    final result=await authRepositoryImpl.resendCode(email: emailController.text,code:codeController.text );
    result.fold((failure){
      emit(ErrorResendCodeState(error: failure.errorMessage));
    },(result){
      emit(SuccessResendCodeState());
      // context.pushNamed(RouterPath.otp);

    });
  }
  resetPassword(ResetPasswordEvent event,Emitter<ForgetPasswordState>emit)async{
    emit(LoadingResetPasswordState());
    final result=await authRepositoryImpl.resetPassword(password: passwordController.text,confirmPassword:confirmPassword.text );
    result.fold((failure){
      emit(ErrorResetPasswordState(error: failure.errorMessage));
    },(result){
      emit(SuccessResetPasswordState());
      // context.pushNamed(RouterPath.otp);

    });
  }
}
