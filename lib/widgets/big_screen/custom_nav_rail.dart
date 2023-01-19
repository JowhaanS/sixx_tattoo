import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/features/admin/login.dart';
import 'package:sixx_tattoo/widgets/background_image.dart';

import '../../app/constants.dart';
import '../../custom_icon_icons.dart';
import '../../features/admin/cubit/auth_cubit.dart';
import '../../cubits/navigation_cubit/navigation_cubit.dart';

class CustomNavRail extends StatefulWidget {
  const CustomNavRail({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomNavRail> createState() => _CustomNavRailState();
}

class _CustomNavRailState extends State<CustomNavRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final AuthCubit bloc = BlocProvider.of<AuthCubit>(context);
    final NavigationCubit navBloc = BlocProvider.of<NavigationCubit>(context);
    return NavigationRail(
        leading: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
          return IconButton(
            onPressed: () {
              if (state is! AuthAuthenticated) {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BackgroundImage(isTransparent: true)
                              .backgroundDecoration(),
                          child: const Login(),
                        ),
                      );
                    });
              } else {}
            },
            icon: const Icon(CustomIcons.logo),
            color: SixxColors.primary,
          );
        }),
        useIndicator: true,
        indicatorColor: SixxColors.primary,
        labelType: NavigationRailLabelType.all,
        selectedIconTheme: const IconThemeData(color: SixxColors.secondary),
        unselectedIconTheme: const IconThemeData(color: SixxColors.secondary),
        selectedLabelTextStyle: const TextStyle(color: SixxColors.secondary),
        unselectedLabelTextStyle: const TextStyle(color: SixxColors.secondary),
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
            BlocProvider.of<NavigationCubit>(context)
                .setScreen(Navigation.values[_selectedIndex]);
          });
        },
        backgroundColor: SixxColors.backGround,
        destinations: <NavigationRailDestination>[
          const NavigationRailDestination(
            icon: Icon(
              Icons.home_outlined,
            ),
            selectedIcon: Icon(Icons.home),
            label: Text('Home'),
          ),
          const NavigationRailDestination(
            icon: Icon(
              Icons.bookmark_border,
            ),
            selectedIcon: Icon(Icons.book),
            label: Text('Gallery'),
          ),
          const NavigationRailDestination(
            icon: Icon(
              Icons.calendar_month_outlined,
            ),
            selectedIcon: Icon(
              Icons.calendar_month,
            ),
            label: Text('Book'),
          ),
          if (bloc.state.isAdmin)
            const NavigationRailDestination(
              icon: Icon(
                Icons.add_a_photo_outlined,
              ),
              selectedIcon: Icon(
                Icons.add_a_photo,
              ),
              label: Text('Add'),
            )
        ],
        selectedIndex: _selectedIndex);
  }
}
