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
          if (state is AuthAuthenticated) {
            return listViewIfLoggedIn(state, context);
          } else {
            return defaultListView(state, context);
          }
        },
      ),
    );
  }

  ListView listViewIfLoggedIn(AuthState state, BuildContext context) {
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
              "Inloggad",
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
          BlocProvider.of<AuthCubit>(context).signOut();
          Navigator.of(context).pop();
        },
        leading: const Icon(
          Icons.logout,
          color: SixxColors.secondary,
        ),
        title: const Text(
          'Logga ut',
          style: TextStyle(
            color: SixxColors.secondary,
            fontSize: 18,
          ),
        ),
      )
    ]);
  }

  ListView defaultListView(AuthState state, BuildContext context) {
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
        onTap: () async {
          if (state is! AuthAuthenticated) {
            Navigator.of(context).pop();
            await loginDialog(context);
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
  }
}
