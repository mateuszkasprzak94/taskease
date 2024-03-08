import 'package:flutter/material.dart';
import 'package:to_do/app/core/constants.dart';
import 'package:to_do/app/widgets/buttons/login_button.dart';
import 'package:to_do/app/widgets/buttons/sing_up_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: kPrimaryGradient,
            tileMode: TileMode.mirror,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 250,
              child: Placeholder(),
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 100,
              width: 100,
              child: Placeholder(),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'More than just a organizer',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 50),
            CustomLoginButton(),
            SizedBox(height: 15),
            CustomSignUpButton(),
          ],
        ),
      ),
    );
  }
}
