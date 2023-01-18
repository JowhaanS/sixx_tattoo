import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial(false));

  late String _verificationId;
  final auth = FirebaseAuth.instance;
  final pinController = TextEditingController(text: null);
  final phoneNumberController = TextEditingController(text: '+46');

  void authenticated() {
    if (FirebaseAuth.instance.currentUser != null &&
        auth.currentUser!.phoneNumber == Constants.artist['number']) {
      {
        emit(AuthAuthenticated(state.loading = false));
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

  // void startWebAuthentication() async {
  //   ConfirmationResult confirmationResult =
  //       await auth.signInWithPhoneNumber(phoneNumberController.text);
  //   print(confirmationResult);
  //   UserCredential userCredential =
  //       await confirmationResult.confirm(pinController.text);
  //   print(userCredential);
  // }

  void enteredValidNumber() {
    // startWebAuthentication();
    startPhoneAuthentication();
    emit(AuthAuthenticate(state.loading = false));
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
    print('kommer jag hit?');
    try {
      emit(AuthAuthenticate(state.loading = true));
      await auth.signInWithCredential(credential);
      print(auth.currentUser?.phoneNumber.runtimeType);
      print(auth.currentUser?.phoneNumber);
      print(Constants.artist['number'].runtimeType);
      print(Constants.artist['number']);
      print(auth.currentUser?.phoneNumber.toString() ==
          Constants.artist['number'].toString());
      if (auth.currentUser!.phoneNumber == Constants.artist['number']) {
        // emit(AuthAuthenticated(state.loading = false));
        print('ska bara kolla om denna behövs');
        return true;
      }
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
