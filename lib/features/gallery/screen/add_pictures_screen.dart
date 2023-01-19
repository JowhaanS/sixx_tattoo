import 'package:flutter/material.dart';
import 'package:sixx_tattoo/app/constants.dart';

import '../../../widgets/background_image.dart';

class AddPictureScreen extends StatefulWidget {
  const AddPictureScreen({super.key});

  @override
  State<AddPictureScreen> createState() => _AddPictureScreenState();
}

class _AddPictureScreenState extends State<AddPictureScreen> {
  String buttonText = "Upload Image";
  bool imagePicked = false;

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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: SixxColors.primary),
                child: Text(
                  buttonText,
                  style: const TextStyle(
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
      // const Center(
      //     child: Text('ADD PICTURES',
      //         style: TextStyle(
      //           color: Color.fromARGB(255, 218, 229, 221),
      //           fontSize: 36,
      //         ))),
    ]);
  }
}


//Button at the bottom that says take or upload image.
//Greyed out button that waits on preview to Actually upload.
//Once image is selected you get a preview and toggle between who's the tattoo artist
//and if it's a stencil or not.

//Then buttontext for take/upload goes "re-do" or something similar