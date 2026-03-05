abstract class ForgetPasswordEvent {}
class InitEvent extends ForgetPasswordEvent {}
class ForgetPasswordByEmailEvent extends ForgetPasswordEvent{}
class SendCodeEvent extends ForgetPasswordEvent{}
class ResendCodeEvent extends ForgetPasswordEvent{}
class ResetPasswordEvent extends ForgetPasswordEvent{}
class PasswordVisibilityEvent extends ForgetPasswordEvent{
  bool passwordVisibility;
  PasswordVisibilityEvent({ this.passwordVisibility=false});
}
class ConfirmPasswordVisibilityEvent extends ForgetPasswordEvent{
  bool passwordVisibility;
  ConfirmPasswordVisibilityEvent({ this.passwordVisibility=false});
}