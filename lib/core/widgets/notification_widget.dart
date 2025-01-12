import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_images.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: Color(0xFFEEF8ED),
        shape: OvalBorder(),
      ),
      child: SvgPicture.asset(Assets.imagesNotification),
    );
  }
}