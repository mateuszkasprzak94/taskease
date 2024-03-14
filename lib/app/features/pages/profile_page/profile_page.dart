import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/cubit/auth_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signed in as: ${user.email}'),
            ElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
              child: const Text('LOGOUT'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().deleteUserAccount();
              },
              child: const Text('DELETE'),
            ),
          ],
        ),
      ),
    );
  }
}
