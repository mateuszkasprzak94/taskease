import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/core/config.dart';
import 'package:to_do/app/cubit/auth_cubit.dart';
import 'package:to_do/app/domain/repositories/items_repository.dart';
import 'package:to_do/app/features/auth_page/login_page/auth_page.dart';
import 'package:to_do/app/features/pages/home_page/home_page.dart';
import 'package:to_do/app/features/auth_page/welcome_page/welcome_page.dart';
import 'package:to_do/app/features/pages/home_page/tab_screens/cubit/tab_screen_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit()..start(),
        ),
        BlocProvider(
          create: (context) => TabScreenCubit(ItemsRepository())..start(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: Config.debugShowCheckedModeBanner,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WelcomePage(),
      ),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final user = state.user;
        if (user == null) {
          return const AuthPage();
        }
        return HomePage(user: user);
      },
    );
  }
}
