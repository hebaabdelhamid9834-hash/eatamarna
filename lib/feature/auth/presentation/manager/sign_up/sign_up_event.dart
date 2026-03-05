abstract class SignUpEvent {}
class PasswordVisibilityEvent extends SignUpEvent{
    bool passwordVisibility;
  PasswordVisibilityEvent({ this.passwordVisibility=false});
}
class ReminderDataEvent extends SignUpEvent{
  bool reminderData;
  ReminderDataEvent({this.reminderData=false});
}
class SignupEvent extends SignUpEvent{}
class GetTermEvent extends SignUpEvent{}
class GetCurrencyEvent extends SignUpEvent{}
class ChangeLanguageEvent extends SignUpEvent{
  final String language;
  final String currency;
  ChangeLanguageEvent({required this.currency,required this.language});
}
class LogoutEvent extends SignUpEvent{}
class ChangCurrency extends SignUpEvent{
  final String currency;
  ChangCurrency({required this.currency});
}