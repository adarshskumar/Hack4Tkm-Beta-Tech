import 'package:flutter/material.dart';
import 'package:phone_auth/Signup/constants.dart';
import 'package:phone_auth/Signup/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged onChanged;
  const RoundedInputField({
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: "Your Email",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
