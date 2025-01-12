import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';
import 'notification_widget.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      ),
    ],
    backgroundColor: Colors.white,
    leading: GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(Icons.arrow_back_ios_new),
    ),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
  );
}
