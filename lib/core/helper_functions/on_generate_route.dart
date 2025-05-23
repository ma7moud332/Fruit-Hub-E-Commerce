import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/presentation/views/signup_view.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit_hub/features/splash/presentation/views/splash_view.dart';

import '../../features/auth/presentation/views/signin_view.dart';
import '../../features/best_selling_fruits/presentation/views/best_selling_view.dart';
import '../../features/checkout/presentation/views/checkout_view.dart';
import '../../features/home/presentation/views/main_view.dart';

Route<dynamic> onGeneratewRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());

    case CheckoutView.routeName:
      return MaterialPageRoute(builder: (_) => const CheckoutView());

    case SigninView.routeName:
      return MaterialPageRoute(builder: (_) => const SigninView());

    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());

    case MainView.routeName:
      return MaterialPageRoute(builder: (_) => const MainView());

    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (_) => const BestSellingView());

    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
