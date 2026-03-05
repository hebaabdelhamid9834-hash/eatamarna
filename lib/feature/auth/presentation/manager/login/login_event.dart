abstract class LoginEvent {}
class InitEvent extends LoginEvent {}
class PasswordVisibilityEvent extends LoginEvent{
  bool passwordVisibility;
  PasswordVisibilityEvent({ this.passwordVisibility=false});
}
class ReminderDataEvent extends LoginEvent{
  bool reminderData;
  ReminderDataEvent({this.reminderData=false});
}
class LogInEvent extends LoginEvent{}