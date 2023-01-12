import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final auth = FirebaseAuth.instance;

  void authenticate() {
    if (FirebaseAuth.instance.currentUser != null) {
      emit(AuthAuthenticated());
    }
  }

  void enteredValidNumber() {
    emit(AuthAuthenticate());
  }
}
