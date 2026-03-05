import 'package:eatamarna/feature/auth/data/model/user_response.dart';

abstract class LoginState {}
class InitialState extends LoginState{}
class PasswordVisibilityState extends LoginState{}
class ReminderDataState extends LoginState{}
class LoadingLogInState extends LoginState{}
class ErrorLogInState extends LoginState{
  String error;
  ErrorLogInState({required this.error});
}
class SuccessLogInState extends LoginState{
  final UserResponse userResponse;
  SuccessLogInState({required this.userResponse});
}
