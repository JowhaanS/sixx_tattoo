part of 'auth_cubit.dart';

abstract class AuthState {
  bool loading = false;
  final pinController = TextEditingController();
  final phoneNumberController = TextEditingController();
}

class AuthInitial extends AuthState {}

class AuthAuthenticate extends AuthState {}

class AuthAuthenticated extends AuthState {}
