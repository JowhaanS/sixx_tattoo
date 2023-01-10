import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void authenticate() {
    if (FirebaseAuth.instance.currentUser != null) {
      emit(AuthAuthenticated());
    }
  }
}
