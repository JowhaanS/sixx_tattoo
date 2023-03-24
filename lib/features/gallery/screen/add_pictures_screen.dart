import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/app/constants.dart';
import 'package:sixx_tattoo/features/admin/cubit/auth_cubit.dart';
import 'package:sixx_tattoo/features/gallery/images_cubit/images_cubit.dart';

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
                  BlocProvider.of<AuthCubit>(context).auth.currentUser!.uid,
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
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'Image uploaded successfully!',
              style: TextStyle(
                color: SixxColors.secondary,
              ),
            ),
            backgroundColor: SixxColors.primary,
          ));
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
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ImagesCubit>(context).choosePicture(
                      BlocProvider.of<AuthCubit>(context).auth.currentUser!.uid,
                    );
                    // Straight to gallery for uploading
                    // BlocProvider.of<ImagesCubit>(context).takePicture(
                    //   BlocProvider.of<AuthCubit>(context).auth.currentUser!.uid,
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: SixxColors.primary),
                  child: const Text(
                    'Upload Stencil',
                    style: TextStyle(
                      color: SixxColors.secondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    _showDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: SixxColors.primary),
                  child: const Text(
                    'Upload Tattoo',
                    style: TextStyle(
                      color: SixxColors.secondary,
                    ),
                  ),
                ),
              ),
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
