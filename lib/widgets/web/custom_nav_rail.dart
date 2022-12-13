import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/cubits/navigation_cubit/navigation_cubit.dart';

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
    return NavigationRail(
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
            BlocProvider.of<NavigationCubit>(context).setScreen(_selectedIndex);
          });
        },
        backgroundColor: const Color.fromARGB(255, 29, 29, 29),
        destinations: const <NavigationRailDestination>[
          NavigationRailDestination(
            icon: Icon(
              Icons.home_outlined,
            ),
            selectedIcon: Icon(Icons.home),
            label: Text('Home'),
          ),
          NavigationRailDestination(
            icon: Icon(
              Icons.bookmark_border,
            ),
            selectedIcon: Icon(Icons.book),
            label: Text('Gallery'),
          ),
          NavigationRailDestination(
            icon: Icon(
              Icons.calendar_month_outlined,
            ),
            selectedIcon: Icon(
              Icons.calendar_month,
            ),
            label: Text('Book'),
          ),
        ],
        selectedIndex: _selectedIndex);
  }
}
