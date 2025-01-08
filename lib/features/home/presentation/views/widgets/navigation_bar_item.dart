import 'package:flutter/material.dart';

import '../../../domain/entites/bottom_navigation_bar_entity.dart';
import 'active_item.dart';
import 'inactive_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveIcon(
            image: bottomNavigationBarEntity.activeImage,
            text: bottomNavigationBarEntity.name,
        )
        : InActiveItem(
            image: bottomNavigationBarEntity.inActiveImage,
          );
  }
}