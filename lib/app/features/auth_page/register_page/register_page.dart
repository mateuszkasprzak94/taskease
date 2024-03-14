import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/app.dart';
import 'package:to_do/app/core/constants.dart';
import 'package:to_do/app/core/enums.dart';
import 'package:to_do/app/cubit/auth_cubit.dart';
import 'package:to_do/app/features/auth_page/login_page/widgets/login_button.dart';
import 'package:to_do/app/features/auth_page/register_page/widgets/register_textfield.dart';
import 'package:to_do/app/widgets/buttons/close_button.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({
    super.key,
    required this.onClickedSignUp,
  });

  final Function() onClickedSignUp;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
                  colors: kPrimaryGradient,
                ),
              ),
              child: SafeArea(
                child: Form(
                  key: formKey,
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
                          // RegisterTextField(
                          //   widget: widget,
                          //   hintText: 'Username',
                          //   icon: Icons.person,
                          //   registerController: widget.usernameController,
                          //   validator: (value) =>
                          //       value != null && value.length > 20
                          //           ? 'Enter max. 20 characters'
                          //           : null,
                          // ),
                          RegisterTextField(
                            widget: widget,
                            hintText: 'Email adress',
                            icon: Icons.email,
                            registerController: widget.emailController,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? 'Enter a valid email'
                                    : null,
                          ),
                          RegisterTextField(
                            widget: widget,
                            hintText: 'Password',
                            icon: Icons.key_outlined,
                            registerController: widget.passwordController,
                            validator: (value) =>
                                value != null && value.length < 6
                                    ? 'Enter min. 6 characters'
                                    : null,
                            obscureText: true,
                          ),
                          RegisterTextField(
                            widget: widget,
                            hintText: 'Confirm password',
                            icon: Icons.key_outlined,
                            registerController:
                                widget.confirmPasswordController,
                            validator: (value) {
                              if (value != widget.passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return value != null && value.length < 6
                                  ? 'Enter min. 6 characters'
                                  : null;
                            },
                            obscureText: true,
                          ),
                        ],
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 45, vertical: 10),
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
                      const SizedBox(height: 65),
                      CustomLoginButton(
                        onTap: () {
                          context.read<AuthCubit>().register(
                                widget.emailController.text,
                                widget.passwordController.text,
                                context,
                                navigatorKey,
                                formKey,
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
            ),
          );
        },
      ),
    );
  }
}