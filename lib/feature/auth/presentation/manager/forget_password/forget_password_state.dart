abstract class ForgetPasswordState {}
class InitialState extends ForgetPasswordState{}
class LoadingForgetPasswordState extends ForgetPasswordState{}
class ErrorForgetPasswordState extends ForgetPasswordState{
  final String error;
  ErrorForgetPasswordState({required this.error});
}
class SuccessForgetPasswordState extends ForgetPasswordState{}
class LoadingSendCodeState extends ForgetPasswordState{}
class ErrorSendCodeState extends ForgetPasswordState{
  final String error;
  ErrorSendCodeState({required this.error});
}
class SuccessSendCodeState extends ForgetPasswordState{}
class LoadingResendCodeState extends ForgetPasswordState{}
class ErrorResendCodeState extends ForgetPasswordState{
  final String error;
  ErrorResendCodeState({required this.error});
}
class SuccessResendCodeState extends ForgetPasswordState{}
class LoadingResetPasswordState extends ForgetPasswordState{}
class ErrorResetPasswordState extends ForgetPasswordState{
  final String error;
  ErrorResetPasswordState({required this.error});
}
class SuccessResetPasswordState extends ForgetPasswordState{}
class PasswordVisibilityState extends ForgetPasswordState{}
class ConfirmPasswordVisibilityState extends ForgetPasswordState{}
