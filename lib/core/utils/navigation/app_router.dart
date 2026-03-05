import 'package:eatamarna/core/utils/navigation/router_path.dart';
import 'package:eatamarna/feature/auth/presentation/view/forget_password/forget_password_view.dart';
import 'package:eatamarna/feature/auth/presentation/view/login/login_view.dart';
import 'package:eatamarna/feature/auth/presentation/view/forget_password/otp_view.dart';
import 'package:eatamarna/feature/auth/presentation/view/forget_password/reset_password_view.dart';
import 'package:eatamarna/feature/auth/presentation/view/sign_up/signup_view.dart';
import 'package:eatamarna/feature/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

import '../../../feature/home/presentation/view/home_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments as dynamic;
    switch (settings.name) {
      case RouterPath.splash:
        return _bottomToTopTransition(
          SplashView(),
          routeName: RouterPath.splash,
        );
      case RouterPath.auth:
        return _bottomToTopTransition(HomeView(), routeName: RouterPath.auth);
      case RouterPath.login:
        return _bottomToTopTransition(LoginView(), routeName: RouterPath.login);
      case RouterPath.signup:
        return _bottomToTopTransition(
          SignupView(),
          routeName: RouterPath.signup,
        );
      case RouterPath.otp:
        if (arguments is Map<String, String> && arguments.containsKey("email")) {
          return _bottomToTopTransition(
            OtpView(email: arguments["email"]!),
            routeName: RouterPath.otp,
          );
        } else {
          throw ArgumentError("OtpView requires email in arguments map");
        }

      case RouterPath.resetPassword:
        return _bottomToTopTransition(
          ResetPasswordView(),
          routeName: RouterPath.resetPassword,
        );
      case RouterPath.forgetPassword:
        return _bottomToTopTransition(
          ForgetPasswordView(),
          routeName: RouterPath.forgetPassword,
        );
      case RouterPath.home:
        return _bottomToTopTransition(HomeView(), routeName: RouterPath.home);
    }
    return null;
  }

  Route _bottomToTopTransition(Widget page, {required String routeName}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: routeName),
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      // transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //   const begin = Offset(0.0, 1.2);
      //   const end = Offset.zero;
      //   const curve = Curves.easeIn;
      //   var tween =
      //       Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      //   var offsetAnimation = animation.drive(tween);
      //   return SlideTransition(
      //     position: offsetAnimation,
      //     child: child,
      //   );
      // },
    );
  }
}
