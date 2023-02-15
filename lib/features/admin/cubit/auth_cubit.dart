import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../app/constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial(false, false));

  late String _verificationId;
  final auth = FirebaseAuth.instance;
  final pinController = TextEditingController(text: null);
  final phoneNumberController = TextEditingController(text: '+46');

  void checkIfAdmin() {
    if (FirebaseAuth.instance.currentUser != null &&
        auth.currentUser!.phoneNumber == Constants.artist['number']) {
      {
        emit(AuthAuthenticated(state.loading = false, state.isAdmin = true));
      }
    }
  }

  void startPhoneAuthentication() {
    auth.verifyPhoneNumber(
        phoneNumber: phoneNumberController.text,
        verificationCompleted: (_) {},
        verificationFailed: (e) {},
        codeSent: (String verificationId, int? token) {
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (e) {});
  }

  void enteredValidNumber() {
    startPhoneAuthentication();
    emit(AuthAuthenticate(state.loading = false, state.isAdmin = false));
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

  Future<bool> verifyPin(String pin) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: pin,
    );
    try {
      emit(AuthAuthenticate(state.loading = true, state.isAdmin = false));
      await auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  dispose() {
    phoneNumberController.dispose();
  }
}
