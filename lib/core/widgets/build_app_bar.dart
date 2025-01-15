  import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';
import 'notification_widget.dart';

AppBar buildAppBar() {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: NotificationWidget(),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'الأكثر مبيعًا',
        style: TextStyles.bold19,
      ),
    );
  }