import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/features/admin/cubit/auth_cubit.dart';
import 'package:sixx_tattoo/app/constants.dart';
import 'package:sixx_tattoo/features/admin/login.dart';
import 'package:sixx_tattoo/widgets/background_image.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      backgroundColor: Colors.black87,
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return ListView(children: [
            Container(
              //Eventuellt sätta en fräsig bild här(?)
              color: SixxColors.backGround,
              width: double.infinity,
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Ej inloggad",
                    style: TextStyle(
                      color: SixxColors.secondary,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                if (state is! AuthAuthenticated) {
                  Navigator.of(context).pop();
                  loginDialog(context);
                } else {}
              },
              leading: const Icon(
                Icons.login,
                color: SixxColors.secondary,
              ),
              title: const Text(
                'Logga in',
                style: TextStyle(
                  color: SixxColors.secondary,
                  fontSize: 18,
                ),
              ),
            )
          ]);
        },
      ),
    );
  }
}
