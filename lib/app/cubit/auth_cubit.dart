import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do/app/core/enums.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  StreamSubscription? _streamSubscription;

  Future<void> register(
    String emailController,
    String passwordController,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController,
        password: passwordController,
      );
    } catch (error) {
      emit(
        AuthState(
          user: state.user,
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> signIn(
    String emailController,
    String passwordController,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController,
        password: passwordController,
      );
    } catch (error) {
      emit(
        AuthState(
          user: state.user,
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
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
