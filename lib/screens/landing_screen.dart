import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/screens/booking_screen.dart';
import 'package:sixx_tattoo/screens/gallery_screen.dart';
import 'package:sixx_tattoo/widgets/mobile/custom_tab_bar.dart';

import '../screens/home_screen.dart';
import '../widgets/web/custom_nav_rail.dart';
import '../cubits/navigation_cubit/navigation_cubit.dart';

class LandingScreen extends StatelessWidget {
  bool isScreenBig(BuildContext context) =>
      MediaQuery.of(context).size.width >= 400;
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => NavigationCubit(),
          child: isScreenBig(context)
              ? Row(children: [
                  const CustomNavRail(),
                  const VerticalDivider(
                    thickness: 6,
                    width: 6,
                    color: Color.fromARGB(255, 88, 168, 174),
                  ),
                  Expanded(
                    child: BlocBuilder<NavigationCubit, NavigationState>(
                        builder: (context, state) {
                      if (state is NavigationInitial ||
                          state is NavigationHome) {
                        return const HomeScreen();
                      }
                      if (state is NavigationGallery) {
                        return const GalleryScreen();
                      }
                      if (state is NavigationBooking) {
                        return const BookingScreen();
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
                    if (state is NavigationInitial || state is NavigationHome) {
                      return const HomeScreen();
                    }
                    if (state is NavigationGallery) {
                      return const GalleryScreen();
                    }
                    if (state is NavigationBooking) {
                      return const BookingScreen();
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
                  bottomNavigationBar: const CustomTabBar(),
                )),
    );
  }
}
