import 'package:eatamarna/feature/auth/presentation/view/forget_password/otp_view_body.dart';
import 'package:flutter/material.dart';

class OtpView extends StatelessWidget {
  final String email ;
  const OtpView({super.key,required this.email});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: OtpViewBody(email: email));
  }
}
