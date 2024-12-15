import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscured;

  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscured = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscured,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
      ),
      validator: (input) {
        if (input!.isEmpty) {
          return "$hintText is empty!";
        }
        return null;
      },
    );
  }
}
