import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/app/constants.dart';
import 'package:sixx_tattoo/features/gallery/screen/add_pictures_screen.dart';
import 'package:sixx_tattoo/features/booking/screen/booking_screen.dart';

import 'package:sixx_tattoo/widgets/small_screen/custom_tab_bar.dart';

import '../features/gallery/screen/gallery_screen.dart';
import 'home_screen.dart';
import '../widgets/big_screen/custom_nav_rail.dart';
import '../features/admin/cubit/auth_cubit.dart';
import '../cubits/navigation_cubit/navigation_cubit.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit bloc = BlocProvider.of<AuthCubit>(context);
    bloc.checkIfAdmin();
    bool isScreenBig = MediaQuery.of(context).size.width >= 480;
    return Scaffold(
        body: isScreenBig
            ? Row(children: [
                const CustomNavRail(),
                const VerticalDivider(
                  thickness: 6,
                  width: 6,
                  color: SixxColors.primary,
                ),
                Expanded(
                  child: BlocBuilder<NavigationCubit, NavigationState>(
                      builder: (context, state) {
                    if (state is NavigationHome) {
                      return const HomeScreen();
                    }
                    if (state is NavigationGallery) {
                      return const GalleryScreen();
                    }
                    if (state is NavigationBooking) {
                      return const BookingScreen();
                    }
                    if (state is NavigationAdd) {
                      return const AddPictureScreen();
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
                ),
              ])
            : Scaffold(
                body: BlocBuilder<NavigationCubit, NavigationState>(
                    builder: (context, state) {
                  if (state is NavigationHome) {
                    return const HomeScreen();
                  }
                  if (state is NavigationGallery) {
                    return const GalleryScreen();
                  }
                  if (state is NavigationBooking) {
                    return const BookingScreen();
                  }
                  if (state is NavigationAdd) {
                    return const AddPictureScreen();
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
                bottomNavigationBar: const CustomTabBar(),
              ));
  }
}
