import 'package:flutter/material.dart';
import 'package:phone_auth/Signup/constants.dart';
import 'package:phone_auth/Signup/widgets/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged onChanged;
  const RoundedPasswordField({
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
