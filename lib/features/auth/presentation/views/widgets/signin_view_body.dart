import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_filed.dart';
import 'package:fruit_hub/core/widgets/password_filed.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_login_button.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';
import 'dont_have_an_account_widget.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextFormFiled(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordFiled(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 33,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signin(email, password);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'تسجيل دخول',
              ),
              SizedBox(
                height: 33,
              ),
              DontHaveAnAccountWidget(),
              SizedBox(
                height: 33,
              ),
              OrDivider(),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                image: Assets.imagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
                onPressed: () {},
              ),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                image: Assets.imagesApplIcon,
                title: 'تسجيل بواسطة أبل',
                onPressed: () {},
              ),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                image: Assets.imagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
