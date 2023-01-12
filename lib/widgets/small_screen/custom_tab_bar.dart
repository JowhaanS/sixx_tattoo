import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/constants.dart';
import '../../features/admin/cubit/auth_cubit.dart';
import '../../cubits/navigation_cubit/navigation_cubit.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return BottomNavigationBar(
          selectedItemColor: const Color.fromARGB(255, 88, 168, 174),
          unselectedItemColor: const Color.fromARGB(255, 218, 229, 221),
          backgroundColor: const Color.fromARGB(255, 20, 20, 20),
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              BlocProvider.of<NavigationCubit>(context)
                  .setScreen(Navigation.values[_selectedIndex]);
            });
          },
          items: [
            const BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home_outlined,
                )),
            const BottomNavigationBarItem(
                label: 'Gallery',
                icon: Icon(
                  Icons.bookmark_border,
                )),
            const BottomNavigationBarItem(
                label: 'Book',
                icon: Icon(
                  Icons.calendar_month_outlined,
                )),
            if (state is AuthAuthenticated)
              const BottomNavigationBarItem(
                label: 'Add image',
                icon: Icon(
                  Icons.add_a_photo_outlined,
                ),
              )
          ],
        );
      },
    );
  }
}
