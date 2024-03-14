import 'package:flutter/material.dart';
import 'package:to_do/app/features/auth_page/login_page/login_page.dart';
import 'package:to_do/app/features/auth_page/register_page/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginPage(onClickedSignUp: toggle)
      : RegisterPage(onClickedSignUp: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
