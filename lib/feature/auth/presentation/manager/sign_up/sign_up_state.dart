import 'package:eatamarna/feature/auth/data/model/currency_reponse.dart';
import 'package:eatamarna/feature/auth/data/model/terms_response.dart';

abstract class SignUpState {}
class InitialState extends SignUpState{}
class PasswordVisibilityState extends SignUpState{}
class ReminderDataState extends SignUpState{}
class LoadingSignupState extends SignUpState{}
class ErrorSignupState extends SignUpState{
  final String error;
  ErrorSignupState({required this.error});
}
class SuccessSignupState extends SignUpState{}
class LoadingGetTermState extends SignUpState{}
class ErrorGetTermState extends SignUpState{
  final String error;
  ErrorGetTermState({required this.error});
}
class SuccessGetTermState extends SignUpState{
  final TermsResponse termsResponse;
  SuccessGetTermState({required this.termsResponse});
}
class LoadingGetCurrencyState extends SignUpState{}
class ErrorGetCurrencyState extends SignUpState{
  final String error;
  ErrorGetCurrencyState({required this.error});
}
class SuccessGetCurrencyState extends SignUpState{
  final CurrencyResponse currencyResponse;
  SuccessGetCurrencyState({required this.currencyResponse});
}
class LoadingChangeLanguageCurrency extends SignUpState{}
class ErrorChangeLanguageCurrency extends SignUpState{
  final String error;
  ErrorChangeLanguageCurrency({required this.error});
}
class SuccessChangeLanguageCurrency extends SignUpState{}
class LoadingLogoutState extends SignUpState{}
class ErrorLogoutState extends SignUpState{
  final String error;
  ErrorLogoutState({required this.error});
}
class SuccessLogoutState extends SignUpState{}