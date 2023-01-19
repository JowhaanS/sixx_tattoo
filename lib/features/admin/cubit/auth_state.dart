part of 'auth_cubit.dart';

abstract class AuthState {
  bool loading = false;
  bool isAdmin = false;
  AuthState(this.loading, this.isAdmin);
}

class AuthInitial extends AuthState {
  AuthInitial(super.loading, super.isAdmin);
}

class AuthAuthenticate extends AuthState {
  AuthAuthenticate(super.loading, super.isAdmin);
}

class AuthAuthenticated extends AuthState {
  AuthAuthenticated(super.loading, super.isAdmin);
}
