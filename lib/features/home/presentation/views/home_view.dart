import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_buttom_navigation_bar.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtomNavigationBar(),
      body: SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
