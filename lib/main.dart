import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:sixx_tattoo/cubits/navigation_cubit/navigation_cubit.dart';
import 'package:sixx_tattoo/features/admin/cubit/auth_cubit.dart';
import 'package:sixx_tattoo/features/gallery/images_cubit/images_cubit.dart';
import 'firebase_options.dart';

import 'screens/landing_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider<NavigationCubit>(
          create: (BuildContext context) => NavigationCubit(),
        ),
        BlocProvider<ImagesCubit>(
          create: (BuildContext context) => ImagesCubit(),
        ),
      ],
      child: const MaterialApp(
        title: 'Sixx Tattoo',
        home: LandingScreen(),
      ),
    );
  }
}
