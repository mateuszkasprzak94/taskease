import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/core/config.dart';
import 'package:to_do/app/cubit/auth_cubit.dart';
import 'package:to_do/app/features/auth_page/login_page/auth_page.dart';
import 'package:to_do/app/features/auth_page/welcome_page/welcome_page.dart';
import 'package:to_do/app/features/pages/home_page/home_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit()..start(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: Config.debugShowCheckedModeBanner,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WelcomePage(),
        navigatorKey: navigatorKey,
        routes: {
          '/notification_screen': (context) => const WelcomePage(),
        },
      ),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
    required this.action,
  });

  final String action;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final user = state.user;
        if (user == null) {
          return AuthPage(action: action);
        }
        return HomePage(user: user);
      },
    );
  }
}
