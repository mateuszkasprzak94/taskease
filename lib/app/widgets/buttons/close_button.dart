import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.65),
              width: 2.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Icon(
              Icons.arrow_back_sharp,
              color: Colors.white.withOpacity(0.65),
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
