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
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return NavigationRail(
            leading: IconButton(
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
                }
              },
              icon: const Icon(CustomIcons.logo),
              color: const Color.fromARGB(255, 88, 168, 174),
            ),
            useIndicator: true,
            indicatorColor: const Color.fromARGB(255, 88, 168, 174),
            labelType: NavigationRailLabelType.all,
            selectedIconTheme:
                const IconThemeData(color: Color.fromARGB(255, 218, 229, 221)),
            unselectedIconTheme:
                const IconThemeData(color: Color.fromARGB(255, 218, 229, 221)),
            selectedLabelTextStyle:
                const TextStyle(color: Color.fromARGB(255, 218, 229, 221)),
            unselectedLabelTextStyle:
                const TextStyle(color: Color.fromARGB(255, 218, 229, 221)),
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
                BlocProvider.of<NavigationCubit>(context)
                    .setScreen(Navigation.values[_selectedIndex]);
              });
            },
            backgroundColor: const Color.fromARGB(255, 29, 29, 29),
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
              if (state is AuthAuthenticated)
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
      },
    );
  }
}
