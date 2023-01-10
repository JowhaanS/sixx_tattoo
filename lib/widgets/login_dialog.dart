import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../cubits/auth_cubit/auth_cubit.dart';

void loginDialog(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (_) => BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return AlertDialog(
                title: const Text('Login'),
                content: SizedBox(
                  height: 600,
                  width: 400,
                  child: TextFormField(
                    controller: state.phoneNumberController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "+46"),
                  ),
                ),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Continue'),
                      onPressed: () {
                        _verifyOTPDialog(context);
                      }),
                ],
              );
            },
          ));
}

void _verifyOTPDialog(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (_) => const AlertDialog(
            title: Text('Verify'),
            content: Pinput(
              length: 6,
            ),
          ));
}

// final _defaultPinTheme = PinTheme(
//   width: 56,
//   height: 56,
//   textStyle: const TextStyle(
//       fontSize: 20,
//       color: Color.fromRGBO(30, 60, 87, 1),
//       fontWeight: FontWeight.w600),
//   decoration: BoxDecoration(
//     border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
//     borderRadius: BorderRadius.circular(20),
//   ),
// );
