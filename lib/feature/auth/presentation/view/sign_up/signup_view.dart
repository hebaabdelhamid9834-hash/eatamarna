import 'package:eatamarna/feature/auth/presentation/view/sign_up/signup_view_body.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  bool reminder;
   SignupView({super.key,  this. reminder=false});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SignupViewBody(reminder:reminder));
  }
}
