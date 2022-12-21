import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthNotAuthenticated());

  void authenticate() async {
    //Logic for checking if this is a tattoo artist or not..

    emit(AuthAuthenticated());
  }
}
