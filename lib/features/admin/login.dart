import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/app/constants.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:sixx_tattoo/widgets/background_image.dart';

import 'cubit/auth_cubit.dart';

part 'components/registeration_scene.dart';
part 'components/verify_otp_scene.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit bloc = BlocProvider.of<AuthCubit>(context);

    return Stack(
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthAuthenticate) {
              return _VerifyOTPScene(bloc: bloc);
            } else {
              return _RegisterationScene(bloc: bloc);
            }
          },
        ),
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

Future<dynamic> loginDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration:
                BackgroundImage(isTransparent: true).backgroundDecoration(),
            child: const Login(),
          ),
        );
      });
}
