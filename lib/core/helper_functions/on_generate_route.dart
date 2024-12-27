import 'package:flutter/material.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit_hub/features/splash/presentation/views/splash_view.dart';

import '../../features/auth/presentation/views/login_view.dart';

Route<dynamic> onGeneratewRoute(RouteSettings settings) {

  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());

    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
