import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do/app/app.dart';
import 'package:to_do/app/core/enums.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  StreamSubscription? _streamSubscription;

  Future<void> register(
    String emailController,
    String passwordController,
    BuildContext context,
    GlobalKey<NavigatorState> navigatorKey,
    GlobalKey<FormState> formKey,
  ) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    bool showError = true;

    try {
      if (showError) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.trim(),
        password: passwordController.trim(),
      );

      navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(
          builder: (context) => const RootPage(),
        ),
      );
      showError = false;
    } catch (error) {
      emit(
        AuthState(
          user: state.user,
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    } finally {
      if (showError) {
        Navigator.of(navigatorKey.currentContext!).pop();
      }
    }
  }

  Future<void> signIn(
    String emailController,
    String passwordController,
    BuildContext context,
    GlobalKey<NavigatorState> navigatorKey,
  ) async {
    bool showError = true;
    try {
      if (showError) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.trim(),
        password: passwordController.trim(),
      );

      navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(
          builder: (context) => const RootPage(),
        ),
      );

      showError = false;
    } catch (error) {
      emit(
        AuthState(
          user: state.user,
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    } finally {
      if (showError) {
        Navigator.of(navigatorKey.currentContext!).pop();
      }
    }
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> deleteUserAccount() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<void> start() async {
    emit(
      AuthState(
        user: null,
        status: Status.loading,
        errorMessage: '',
      ),
    );

    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      emit(
        AuthState(
          user: user,
          status: Status.success,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            emit(
              AuthState(
                user: null,
                status: Status.error,
                errorMessage: error.toString(),
              ),
            );
          });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
