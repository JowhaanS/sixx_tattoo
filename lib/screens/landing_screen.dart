import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/app/constants.dart';
import 'package:sixx_tattoo/features/gallery/images_cubit/images_cubit.dart';
import 'package:sixx_tattoo/features/gallery/screen/add_pictures_screen.dart';
import 'package:sixx_tattoo/features/booking/screen/booking_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sixx_tattoo/widgets/small_screen/custom_tab_bar.dart';

import '../features/gallery/screen/gallery_screen.dart';
import '../widgets/small_screen/custom_drawer.dart';
import 'home_screen.dart';
import '../widgets/big_screen/custom_nav_rail.dart';
import '../features/admin/cubit/auth_cubit.dart';
import '../cubits/navigation_cubit/navigation_cubit.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthCubit>(context).checkIfAdmin();
    bool isScreenBig = MediaQuery.of(context).size.width >= 480;
    return Scaffold(
      backgroundColor: SixxColors.backGround,
      appBar: isScreenBig
          ? null
          : AppBar(
              centerTitle: true,
              title: const Text('Sixx Tattoo'),
              backgroundColor: SixxColors.backGround,
              foregroundColor: SixxColors.secondary,
              actions: [
                BlocBuilder<NavigationCubit, NavigationState>(
                    builder: (context, state) {
                  if (state is NavigationGallery) {
                    return PopupMenuButton(
                      color: SixxColors.backGround,
                      icon: const Icon(
                        Icons.tune_rounded,
                        color: SixxColors.secondary,
                      ),
                      onSelected: (value) {
                        BlocProvider.of<ImagesCubit>(context).setFilter(value);
                      },
                      itemBuilder: (ctx) => const [
                        PopupMenuItem(
                          value: FilterOptions.all,
                          child: Text(
                            'All',
                            style: TextStyle(
                              color: SixxColors.secondary,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: FilterOptions.tattoosOnly,
                          child: Text(
                            'Tattoos only',
                            style: TextStyle(
                              color: SixxColors.secondary,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: FilterOptions.stencilsOnly,
                          child: Text(
                            'Stencils only',
                            style: TextStyle(
                              color: SixxColors.secondary,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: FilterOptions.christian,
                          child: Text(
                            'Tattoos by Christian',
                            style: TextStyle(
                              color: SixxColors.secondary,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: FilterOptions.christianStencil,
                          child: Text(
                            'Stencils of Christian',
                            style: TextStyle(
                              color: SixxColors.secondary,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: FilterOptions.emanuel,
                          child: Text(
                            'Tattoos by Emanuel',
                            style: TextStyle(
                              color: SixxColors.secondary,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: FilterOptions.emanuelStencil,
                          child: Text(
                            'Stencils of Emanuel',
                            style: TextStyle(
                              color: SixxColors.secondary,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return IconButton(
                    onPressed: () {
                      {
                        if (defaultTargetPlatform == TargetPlatform.iOS) {
                          launchUrl(Constants.googleUriApple);
                        } else {
                          launchUrl(Constants.googleUriAndroid);
                        }
                      }
                    },
                    icon: const Icon(
                      Icons.location_on_outlined,
                      color: SixxColors.secondary,
                      size: 32,
                    ),
                  );
                })
              ],
            ),
      drawer: const CustomDrawer(),
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
          : BlocBuilder<NavigationCubit, NavigationState>(
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
      bottomNavigationBar: isScreenBig ? null : const CustomTabBar(),
    );
  }
}
