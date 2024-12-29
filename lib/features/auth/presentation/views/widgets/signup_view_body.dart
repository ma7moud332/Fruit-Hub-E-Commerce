import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/terms_and_conditions.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_filed.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';
import 'have_an_account_widget.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, email, password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
                    name = value!;
                  },
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.name,
                ),
                const SizedBox(
                  height: 16,
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
                CustomTextFormFiled(
                  onSaved: (value) {
                    password = value!;
                  },
                  suffixIcon: const Icon(
                    Icons.remove_red_eye,
                    color: Color(0xffC9CeCF),
                  ),
                  hintText: 'كلمة المرور',
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 16,
                ),
                TermsAndConditions(),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email,
                            password,
                            name,
                          );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: 'إنشاء حساب جديد',
                ),
                SizedBox(
                  height: 26,
                ),
                HaveAnAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
