import 'package:flutter/material.dart';
import 'package:to_do/app/core/constants.dart';
import 'package:to_do/app/features/pages/login_page/login_page.dart';
import 'package:to_do/app/features/pages/login_page/widgets/login_button.dart';
import 'package:to_do/app/features/pages/register_page/widgets/register_textfield.dart';
import 'package:to_do/app/widgets/buttons/close_button.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: kPrimaryGradient,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CustomCloseButton(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Create your account',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white.withOpacity(0.50),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  RegisterTextField(
                    widget: widget,
                    hintText: 'Username',
                    icon: Icons.person,
                    registerController: widget.usernameController,
                  ),
                  RegisterTextField(
                    widget: widget,
                    hintText: 'Email adress',
                    icon: Icons.email,
                    registerController: widget.emailController,
                  ),
                  RegisterTextField(
                    widget: widget,
                    hintText: 'Password',
                    icon: Icons.key_outlined,
                    registerController: widget.passwordController,
                  ),
                  RegisterTextField(
                    widget: widget,
                    hintText: 'Confirm password',
                    icon: Icons.key_outlined,
                    registerController: widget.confirmPasswordController,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'By registering you are agreeing to our Terms of use and Privacy Policy.',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CustomLoginButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => LoginPage(),
                    ),
                  );
                },
                title: 'REGISTER',
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => LoginPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.8,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
