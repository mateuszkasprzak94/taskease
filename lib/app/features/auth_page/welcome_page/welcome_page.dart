import 'package:flutter/material.dart';
import 'package:to_do/app/app.dart';
import 'package:to_do/app/core/constants.dart';
import 'package:to_do/app/features/auth_page/login_page/widgets/login_button.dart';
import 'package:to_do/app/features/auth_page/login_page/widgets/sing_up_button.dart';

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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const RootPage(action: 'login'),
                  ),
                );
              },
              title: 'LOGIN',
            ),
            const SizedBox(height: 15),
            CustomSignUpButton(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const RootPage(action: 'signup'),
                  ),
                );
              },
              title: 'SIGN UP',
            ),
          ],
        ),
      ),
    );
  }
}
