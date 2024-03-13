import 'package:flutter/material.dart';
import 'package:to_do/app/app.dart';
import 'package:to_do/app/core/constants.dart';
import 'package:to_do/app/core/enums.dart';
import 'package:to_do/app/cubit/auth_cubit.dart';
import 'package:to_do/app/features/pages/login_page/widgets/login_button.dart';
import 'package:to_do/app/widgets/buttons/close_button.dart';
import 'package:to_do/app/features/pages/login_page/widgets/login_textfield.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
    required this.onClickedSignUp,
  });

  final VoidCallback onClickedSignUp;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    widget.emailController.addListener(() => setState(() {}));

    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            final errorMessage = state.errorMessage ?? 'Unknown error';

            if (state.status == Status.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
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
                child: SafeArea(
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          CustomCloseButton(),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset('assets/images/welcome.png'),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.white.withOpacity(0.70),
                          ),
                        ),
                      ),
                      Text(
                        'Login to your account',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white.withOpacity(0.50),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      LoginTextFieldWidget(
                        controller: widget.emailController,
                        hintText: 'Email adress',
                        icon: Icons.email,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10) +
                            const EdgeInsets.only(top: 10),
                        child: Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0, 15),
                                blurRadius: 25,
                              ),
                            ],
                          ),
                          child: TextField(
                            obscureText: isPasswordVisible,
                            controller: widget.passwordController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: kButtonBorder, width: 2.5),
                              ),
                              prefixIcon: const Icon(
                                Icons.key_outlined,
                                color: kHintColor,
                              ),
                              suffixIcon: IconButton(
                                icon: isPasswordVisible
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onPressed: () => setState(
                                  () => isPasswordVisible = !isPasswordVisible,
                                ),
                              ),
                              hintText: 'Password',
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: const TextStyle(
                                color: kHintColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomLoginButton(
                        onTap: () {
                          context.read<AuthCubit>().signIn(
                              widget.emailController.text,
                              widget.passwordController.text,
                              context,
                              navigatorKey);
                        },
                        title: 'LOGIN',
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: widget.onClickedSignUp,
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
                                'Sign up',
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
          },
        ),
      ),
    );
  }
}
