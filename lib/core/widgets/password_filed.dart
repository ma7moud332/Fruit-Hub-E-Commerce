import 'package:flutter/material.dart';
import 'custom_text_filed.dart';

class PasswordFiled extends StatefulWidget {
  const PasswordFiled({
    super.key,
    this.onSaved,
  });

  final void Function(String?)? onSaved;

  @override
  State<PasswordFiled> createState() => _PasswordFiledState();
}

class _PasswordFiledState extends State<PasswordFiled> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFiled(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CeCF),
              )
            : const Icon(
                Icons.visibility_off,
                color: Color(0xffC9CeCF),
              ),
      ),
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
    );
  }
}
