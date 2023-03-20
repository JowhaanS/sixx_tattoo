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
          backgroundColor: SixxColors.backGround,
          title: const Text('Choose existing or take a picture'),
          content: const Text('You can chose wether to take a picture\n'
              'or choose to pick an existing\n'
              'image on your device\n'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Take photo'),
              onPressed: () {
                print('Ta en ny bild');
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Pick a photo'),
              onPressed: () {
                print('Välj befintlig bild');
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
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
    return Stack(children: [
      Container(
        decoration: BackgroundImage(isTransparent: true).backgroundDecoration(),
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
                  _showDialog(context);
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
                  // BlocProvider.of<ImagesCubit>(context).takePicture(
                  //   BlocProvider.of<AuthCubit>(context).auth.currentUser!.uid,
                  // );
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
    ]);
  }
}

//Button at the bottom that says take or upload image.
//Greyed out button that waits on preview to Actually upload.
//Once image is selected you get a preview and toggle between who's the tattoo artist
//and if it's a stencil or not.

//Then buttontext for take/upload goes "re-do" or something similar