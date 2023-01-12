import 'package:flutter/material.dart';

import '../../../widgets/background_image.dart';

class AddPictureScreen extends StatefulWidget {
  const AddPictureScreen({super.key});

  @override
  State<AddPictureScreen> createState() => _AddPictureScreenState();
}

class _AddPictureScreenState extends State<AddPictureScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BackgroundImage(isTransparent: true).backgroundDecoration(),
      ),
      const Center(
          child: Text('ADD PICTURES',
              style: TextStyle(
                color: Color.fromARGB(255, 218, 229, 221),
                fontSize: 36,
              ))),
    ]);
    ;
  }
}
