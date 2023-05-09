import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/app/constants.dart';
import 'package:sixx_tattoo/features/gallery/images_cubit/images_cubit.dart';

class CustomGalleryTabBar extends StatefulWidget {
  const CustomGalleryTabBar({super.key});

  @override
  State<CustomGalleryTabBar> createState() => _CustomGalleryTabBarState();
}

class _CustomGalleryTabBarState extends State<CustomGalleryTabBar> {
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: SixxColors.primary,
      unselectedItemColor: SixxColors.secondary,
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
        BlocProvider.of<ImagesCubit>(context)
            .setFilter(FilterOptions.values[_selectedIndex]);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.brush_rounded),
          label: 'Emanuel',
          backgroundColor: SixxColors.backGround,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brush_rounded),
          label: 'Christian',
          backgroundColor: SixxColors.backGround,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.all_inclusive_rounded),
          label: 'All',
          backgroundColor: SixxColors.backGround,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.create_rounded),
          label: 'Christian',
          backgroundColor: SixxColors.backGround,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.create_rounded),
          label: 'Emanuel',
          backgroundColor: SixxColors.backGround,
        ),
      ],
    );
  }
}
