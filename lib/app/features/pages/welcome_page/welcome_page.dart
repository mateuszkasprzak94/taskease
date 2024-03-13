import 'package:flutter/material.dart';
import 'package:to_do/app/core/constants.dart';
import 'package:to_do/app/features/pages/login_page/login_page.dart';
import 'package:to_do/app/features/pages/login_page/widgets/login_button.dart';
import 'package:to_do/app/features/pages/login_page/widgets/sing_up_button.dart';
import 'package:to_do/app/features/pages/register_page/register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void navigateToLogin(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => LoginPage(
          onClickedSignUp: () {
            navigateToRegister(context);
          },
        ),
      ),
      (route) => route.isFirst,
    );
  }

  void navigateToRegister(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => RegisterPage(
          onClickedSignUp: () {
            navigateToLogin(context);
          },
        ),
      ),
      (route) => route.isFirst,
    );
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Image.asset(
                'assets/images/ease.png',
                fit: BoxFit.fill,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'More than just an organizer',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 50),
            CustomLoginButton(
              onTap: () {
                navigateToLogin(context);
              },
              title: 'LOGIN',
            ),
            const SizedBox(height: 15),
            CustomSignUpButton(
              onTap: () {
                navigateToRegister(context);
              },
              title: 'SIGN UP',
            ),
          ],
        ),
      ),
    );
  }
}
