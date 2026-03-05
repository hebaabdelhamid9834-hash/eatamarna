import 'package:bloc/bloc.dart';
import 'package:eatamarna/feature/auth/data/repo/auth_repository_impl.dart';
import 'package:flutter/material.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._authRepositoryImpl) : super(InitialState()){
    on<PasswordVisibilityEvent>(_passwordVisibility);
    on<ReminderDataEvent>(_reminderData);
    on<LogInEvent>(_login);
  }
  final AuthRepositoryImpl _authRepositoryImpl;
  bool isRemembered=false;
  bool isPasswordVisible = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController phoneCodeController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final String countryCode="";
  _passwordVisibility(PasswordVisibilityEvent event,Emitter<LoginState>emit){
    isPasswordVisible=event.passwordVisibility;
    emit(PasswordVisibilityState());
  }
  _reminderData(ReminderDataEvent event ,Emitter<LoginState>emit){
    isRemembered=event.reminderData;
    emit(ReminderDataState());
  }
  _login(LogInEvent event,Emitter<LoginState>emit)async{
    print("code ${countryCode}");
    if (!formKey.currentState!.validate()) return;
    emit(LoadingLogInState());
    final result=await _authRepositoryImpl.login(phone: phoneController.text, countryCode: phoneCodeController.text, password: passwordController.text);
    result.fold((failure){
      print("error ${failure.errorMessage}");
      emit(ErrorLogInState(error: failure.errorMessage));
    }, (response){
      emit(SuccessLogInState(userResponse: response));
    });
  }

}
