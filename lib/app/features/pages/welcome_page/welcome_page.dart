import 'package:flutter/material.dart';
import 'package:to_do/app/core/constants.dart';
import 'package:to_do/app/features/pages/login_page/login_page.dart';
import 'package:to_do/app/features/pages/login_page/widgets/login_button.dart';
import 'package:to_do/app/features/pages/login_page/widgets/sing_up_button.dart';

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
            const SizedBox(
              height: 200,
              width: 250,
              child: Placeholder(),
            ),
            const SizedBox(height: 50),
            const SizedBox(
              height: 100,
              width: 100,
              child: Placeholder(),
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
                    builder: (_) => LoginPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            const CustomSignUpButton(),
          ],
        ),
      ),
    );
  }
}
