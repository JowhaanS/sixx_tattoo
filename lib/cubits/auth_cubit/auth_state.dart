part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthNotAuthenticated extends AuthState {}

class AuthAuthenticated extends AuthState {}
