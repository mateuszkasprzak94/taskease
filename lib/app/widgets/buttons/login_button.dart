import 'package:flutter/material.dart';
import 'package:to_do/app/core/constants.dart';
import 'package:to_do/app/features/pages/login_page/login_page.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const LoginPage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(3, 3),
              blurRadius: 3,
              color: Colors.black.withOpacity(0.3),
            ),
          ],
          color: kPrimary,
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
            'LOGIN',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
