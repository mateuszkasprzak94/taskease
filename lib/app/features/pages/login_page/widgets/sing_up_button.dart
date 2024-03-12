import 'package:flutter/material.dart';
import 'package:to_do/app/core/constants.dart';
import 'package:to_do/app/features/pages/register_page/register_page.dart';

class CustomSignUpButton extends StatelessWidget {
  const CustomSignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => RegisterPage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(color: Colors.black, width: 1.5),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 60),
        child: const Center(
          child: Text(
            'SIGN UP',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: kPrimary,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
