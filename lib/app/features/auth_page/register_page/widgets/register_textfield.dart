import 'package:flutter/material.dart';
import 'package:to_do/app/core/constants.dart';
import 'package:to_do/app/features/auth_page/register_page/register_page.dart';

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({
    super.key,
    required this.widget,
    required this.hintText,
    required this.icon,
    required this.registerController,
    required this.validator,
    this.obscureText = false,
  });

  final RegisterPage widget;
  final String hintText;
  final IconData icon;
  final TextEditingController registerController;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10) +
          const EdgeInsets.only(top: 10),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 15),
              blurRadius: 25,
            ),
          ],
        ),
        child: TextFormField(
          obscureText: obscureText,
          keyboardType: TextInputType.emailAddress,
          controller: registerController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: kButtonBorder, width: 2.5),
            ),
            prefixIcon: Icon(
              icon,
              color: kHintColor,
            ),
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            hintStyle: const TextStyle(
              color: kHintColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          style: const TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
