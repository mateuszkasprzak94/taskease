import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/cubit/auth_cubit.dart';
import 'package:to_do/app/features/pages/profile_page/widgets/profile_button.dart';
import 'package:to_do/app/widgets/animations/animation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const FadeInAnimation(
              delay: 1,
              child: Text(
                'Signed in as:',
                style: TextStyle(fontSize: 25),
              ),
            ),
            FadeInAnimation(
              delay: 1.3,
              child: Text(
                '$email',
                style: const TextStyle(
                    fontSize: 16, decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 250),
            FadeInAnimation(
              delay: 1.6,
              child: ProfileButton(
                title: 'Delete',
                icon: Icons.delete,
                onTap: () {
                  context.read<AuthCubit>().deleteUserAccount();
                  Navigator.of(context).pop();
                },
              ),
            ),
            FadeInAnimation(
              delay: 1.9,
              child: ProfileButton(
                title: 'Logout',
                icon: Icons.logout,
                onTap: () {
                  context.read<AuthCubit>().signOut();
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
