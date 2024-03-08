import 'package:flutter/material.dart';
import 'package:to_do/app/core/config.dart';
import 'package:to_do/app/features/pages/welcome_page/welcome_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: Config.debugShowCheckedModeBanner,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}
