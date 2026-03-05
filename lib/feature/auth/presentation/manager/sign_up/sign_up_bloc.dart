import 'package:bloc/bloc.dart';
import 'package:eatamarna/core/network/tocken_storage_service.dart';
import 'package:eatamarna/feature/auth/data/repo/auth_repository_impl.dart';
import 'package:flutter/material.dart';

import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required this.isReminder, required this.authRepositoryImpl})
    : super(InitialState()) {
    on<PasswordVisibilityEvent>(_passwordVisibility);
    on<ReminderDataEvent>(_reminderData);
    on<SignupEvent>(_signup);
    on<GetTermEvent>(_getTerm);
    on<GetCurrencyEvent>(_getCurrency);
    on<ChangeLanguageEvent>(_changeLanguageAndCurrency);
    on<LogoutEvent>(_logout);
    on<ChangCurrency>(_changeCurrency);
  }
  AuthRepositoryImpl authRepositoryImpl;
  bool isReminder;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String countryCode = "965";
  bool isPasswordVisible = false;
  late bool isRemembered = isReminder;
  _passwordVisibility(
    PasswordVisibilityEvent event,
    Emitter<SignUpState> emit,
  )
  {
    isPasswordVisible = event.passwordVisibility;
    emit(PasswordVisibilityState());
  }

  _reminderData(ReminderDataEvent event, Emitter<SignUpState> emit) {
    isRemembered = event.reminderData;
    emit(ReminderDataState());
  }

  _signup(SignUpEvent event, Emitter<SignUpState> emit) async {
    if (!formKey.currentState!.validate()) return;
    print("here");
    emit(LoadingSignupState());
    final result = await authRepositoryImpl.signUp(
      fName: fNameController.text,
      lName: lNameController.text,
      countryCode: countryCode,
      phone: phoneController.text,
      password: passwordController.text,
      email: emailController.text,
      term: isReminder==true?"0":"1"
    );
    print("here");

    result.fold(
      (failure) {
        print("error ${failure.errorMessage}");
        emit(ErrorSignupState(error: failure.errorMessage));
      },
      (result) {
        print("here");

        emit(SuccessSignupState());
      },
    );
  }
  _logout(LogoutEvent event,Emitter<SignUpState>emit)async{
    emit(LoadingLogoutState());
    final result =await authRepositoryImpl.logout();
    result.fold((failure){
      print("error${failure.errorMessage}");
      emit(ErrorLogoutState(error: failure.errorMessage));
    }, (result){
      emit(SuccessLogoutState());
       TokenStorageService().deleteToken();
    });
  }
  _getTerm(GetTermEvent event , Emitter<SignUpState>emit )async{
    emit(LoadingGetTermState());
    final result=await authRepositoryImpl.getTerms();
    result.fold((failure){
      emit(ErrorGetTermState(error: failure.errorMessage));
    }, (terms){
      emit(SuccessGetTermState(termsResponse:terms));
    });
  }
  _getCurrency(GetCurrencyEvent event,Emitter<SignUpState>emit)async{
    emit(LoadingGetCurrencyState());
    final result=await authRepositoryImpl.getCurrency();
    result.fold((failure){
      print("error ${failure.errorMessage}");
      emit(ErrorGetCurrencyState(error: failure.errorMessage));
    }, (currency){
      emit(SuccessGetCurrencyState(currencyResponse: currency));
    });
  }
  _changeLanguageAndCurrency(ChangeLanguageEvent event,Emitter<SignUpState>emit)async{
    emit(LoadingChangeLanguageCurrency());
print("currency${event.currency}");
        final result=await authRepositoryImpl.changeLanguageAndCurrency(language: event.language=="ar"?"egy":event.language, currency: "KWD");
    result.fold((failure){
      emit(ErrorChangeLanguageCurrency(error: failure.errorMessage));
    }, (r){
      emit(SuccessChangeLanguageCurrency());
    });
  }
  String currency="KWD";
  _changeCurrency(ChangCurrency event ,Emitter<SignUpState>emit){
    print("currency${event.currency}");
    currency=event.currency;
  }

  @override
  void dispose() {
  }

}
