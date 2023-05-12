import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../app/constants.dart';

part 'auth_state.dart';

//Skriva om så state defaultar false på isLoading så blir det mindre kludd.

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial(false, false));

  late String _verificationId;
  final auth = FirebaseAuth.instance;
  final focusNode = FocusNode();
  final pinController = TextEditingController(text: null);
  final phoneNumberController = TextEditingController(text: '+46');
  bool incorrectPin = false;
  bool completed = false;

  void checkIfAdmin() {
    if (FirebaseAuth.instance.currentUser != null) {
      if (auth.currentUser!.phoneNumber == Constants.artist['number'] ||
          auth.currentUser!.phoneNumber == Constants.artist2['number']) {
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
    signInOnNative();
    // startPhoneAuthentication();
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
        phoneNumber.contains('+') ? false : phoneNumber.characters.length >= 11;
    if (isValid) {
      focusNode.unfocus();
      enteredValidNumber();
    }
    return isValid ? phoneNumber : null;
  }

  void verifyPinForPhone(BuildContext context, String pin) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: pin);
    try {
      emit(AuthAuthenticate(state.loading = true, state.isAdmin = false));
      await auth.signInWithCredential(credential);
      emit(AuthAuthenticated(state.loading = false, state.isAdmin = false));
      completed = true;
    } catch (e) {
      incorrectPin = true;
      emit(AuthAuthenticate(state.loading = false, state.isAdmin = false));
    }
  }

  void verifyPinForWeb(BuildContext context, String pin) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: pin,
    );
    try {
      emit(AuthAuthenticate(state.loading = true, state.isAdmin = false));
      await auth.signInWithCredential(credential);
      emit(AuthAuthenticated(state.loading = false, state.isAdmin = false));
    } catch (e) {
      incorrectPin = true;
      emit(AuthAuthenticate(state.loading = false, state.isAdmin = false));
    }
  }

  void signInOnNative() {
    auth.verifyPhoneNumber(
        phoneNumber: phoneNumberController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (_) {},
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (_) {});
  }

  void signOut() {
    auth.signOut();
    emit(AuthInitial(false, false));
  }

  dispose() {
    phoneNumberController.dispose();
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithGoogleOnWeb() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }
}
