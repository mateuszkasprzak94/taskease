part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    User? user,
    @Default(Status.initial) Status status,
    String? errorMessage,
  }) = _AuthState;
}
