part of 'auth_cubit.dart';

abstract class AuthState {
  bool loading = false;
  AuthState(this.loading);
}

class AuthInitial extends AuthState {
  AuthInitial(super.loading);
}

class AuthAuthenticate extends AuthState {
  AuthAuthenticate(super.loading);
}

class AuthAuthenticated extends AuthState {
  AuthAuthenticated(super.loading);
}
