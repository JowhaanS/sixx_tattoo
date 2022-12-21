import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../widgets/background_image.dart';
import '../cubits/auth_cubit/auth_cubit.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BackgroundImage(isTransparent: true).backgroundDecoration(),
      ),
      const Center(
          child: Text('GALLERY',
              style: TextStyle(
                color: Color.fromARGB(255, 218, 229, 221),
                fontSize: 36,
              ))),
      BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        if (state is AuthAuthenticated) {
          return ElevatedButton(
              onPressed: () {}, child: const Text('ADD IMAGE'));
        }
        return Container();
      })
    ]);
  }
}
