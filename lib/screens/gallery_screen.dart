import 'package:flutter/material.dart';

import '../widgets/background_image.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BackgroundImage(isTransparent: true).backgroundDecoration(),
      ),
      const Center(
        child: Text('GALLERY',
            style: TextStyle(
              color: Color.fromARGB(255, 218, 229, 221),
              fontSize: 36,
            )),
      ),
    ]);
  }
}
