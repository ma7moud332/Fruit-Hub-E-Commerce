import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../signup_view.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: 'لا تمتلك حساب؟',
              style: TextStyles.semiBold16.copyWith(
                color: Color(0xFF949D9E),
              )),
          TextSpan(
            text: ' ',
            style: TextStyle(
              color: Color(0xFF616A6B),
              fontSize: 16,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
              height: 1.40,
            ),
          ),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pushNamed(SignupView.routeName);
                },
              text: 'قم بإنشاء حساب',
              style: TextStyles.semiBold16
                  .copyWith(color: AppColors.primaryColor)),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}