import 'package:flutter/material.dart';
import 'package:to_do/app/features/auth_page/login_page/login_page.dart';
import 'package:to_do/app/features/auth_page/register_page/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
    required this.action,
  });
  final String action;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  @override
  void initState() {
    super.initState();
    showLoginPage =
        widget.action == 'login'; // Initialize showLoginPage based on action
  }

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreens);
    } else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}
