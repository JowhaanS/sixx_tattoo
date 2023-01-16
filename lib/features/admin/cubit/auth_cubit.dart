import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final auth = FirebaseAuth.instance;
  final phoneNumberController = TextEditingController();

  void authenticate() {
    if (FirebaseAuth.instance.currentUser != null) {
      emit(AuthAuthenticated());
    }
  }

  void enteredValidNumber() {
    emit(AuthAuthenticate());
  }

  bool checkIfPhoneNumberEmpty() {
    return phoneNumberController.text.isEmpty;
  }

  String? validateNumber() {
    String phoneNumber = phoneNumberController.text.trim();
    phoneNumber = phoneNumber.characters.first == "+"
        ? phoneNumber.replaceRange(0, 1, "")
        : phoneNumber;
    if (phoneNumber.isEmpty) return null;
    final bool isValid =
        phoneNumber.contains('+') ? false : phoneNumber.characters.length >= 10;
    return isValid ? phoneNumber : null;
  }
}
