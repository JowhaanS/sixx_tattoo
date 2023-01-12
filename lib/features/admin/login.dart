import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import 'cubit/auth_cubit.dart';

part 'components/registeration_scene.dart';
part 'components/verify_otp_scene.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (context) => AuthCubit(), child: _LoginBuilder(key: key));
}

class _LoginBuilder extends StatelessWidget {
  const _LoginBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit bloc = BlocProvider.of<AuthCubit>(context);

    return Stack(
      children: [
        Column(children: [
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthAuthenticate) {
                return _VerifyOTPScene(bloc: bloc);
              } else {
                return _RegisterationScene(bloc: bloc);
              }
            },
          ),
        ]),
        Positioned(
          top: 8,
          left: 8,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.close, color: Colors.white, size: 25),
            ),
          ),
        )
      ],
    );
  }
}
