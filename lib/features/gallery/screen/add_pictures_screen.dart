import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/app/constants.dart';
import 'package:sixx_tattoo/features/admin/cubit/auth_cubit.dart';
import 'package:sixx_tattoo/features/gallery/images_cubit/images_cubit.dart';
import 'package:sixx_tattoo/widgets/custom_button.dart';

import '../../../widgets/background_image.dart';

class AddPictureScreen extends StatelessWidget {
  const AddPictureScreen({super.key});

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: SixxColors.secondary,
          title: const Text(
            'Take a picture or choose from gallery',
            style: TextStyle(
              color: SixxColors.backGround,
            ),
          ),
          content: const Text(
            'You can chose wether to take a picture or pick an existing '
            'image on your device',
            style: TextStyle(
              color: SixxColors.backGround,
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Take photo',
                style: TextStyle(
                  color: SixxColors.primary,
                ),
              ),
              onPressed: () {
                BlocProvider.of<ImagesCubit>(context).takePicture(
                  BlocProvider.of<AuthCubit>(context).auth.currentUser!.uid,
                  BlocProvider.of<AuthCubit>(context)
                      .auth
                      .currentUser!
                      .phoneNumber!,
                );
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Pick a photo',
                style: TextStyle(
                  color: SixxColors.primary,
                ),
              ),
              onPressed: () {
                BlocProvider.of<ImagesCubit>(context).choosePicture(
                  false,
                  BlocProvider.of<AuthCubit>(context).auth.currentUser!.uid,
                  BlocProvider.of<AuthCubit>(context)
                      .auth
                      .currentUser!
                      .phoneNumber!,
                );
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImagesCubit, ImagesState>(
      listener: (context, state) {
        if (state is ImagesUploadSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(CustomSnackbar.snackBarUploadSuccess);
        }
      },
      child: Stack(children: [
        Container(
          decoration:
              BackgroundImage(isTransparent: true).backgroundDecoration(),
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                title: 'Upload Stencil',
                onTapped: () =>
                    BlocProvider.of<ImagesCubit>(context).choosePicture(
                  true,
                  BlocProvider.of<AuthCubit>(context).auth.currentUser!.uid,
                  BlocProvider.of<AuthCubit>(context)
                      .auth
                      .currentUser!
                      .phoneNumber!,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                  title: 'Upload Tattoo', onTapped: () => _showDialog(context)),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        )
      ]),
    );
  }
}
