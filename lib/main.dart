import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper_functions/on_generate_route.dart';
import 'package:fruit_hub/features/splash/presentation/views/splash_view.dart';


void main() {
  runApp( FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGeneratewRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
    );
  }
}
