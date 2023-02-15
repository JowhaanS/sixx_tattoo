import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/app/constants.dart';
import 'package:sixx_tattoo/features/admin/cubit/auth_cubit.dart';
import 'package:sixx_tattoo/features/gallery/images_cubit/images_cubit.dart';

import '../../../widgets/background_image.dart';

class AddPictureScreen extends StatelessWidget {
  const AddPictureScreen({super.key});

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
                  BlocProvider.of<ImagesCubit>(context).takePicture(
                    BlocProvider.of<AuthCubit>(context).auth.currentUser!.uid,
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: SixxColors.primary),
                child: const Text(
                  'Select Image',
                  style: TextStyle(
                    color: SixxColors.secondary,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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