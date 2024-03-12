import 'package:flutter/material.dart';
import 'package:to_do/app/core/constants.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({
    required this.onTap,
    required this.title,
    super.key,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(3, 3),
              blurRadius: 1,
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
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
