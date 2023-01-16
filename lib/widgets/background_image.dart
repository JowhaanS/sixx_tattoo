import 'package:flutter/material.dart';
import 'package:sixx_tattoo/app/constants.dart';

class BackgroundImage {
  BackgroundImage({required this.isTransparent});

  final bool isTransparent;

  BoxDecoration backgroundDecoration() {
    return BoxDecoration(
        color: SixxColors.backGround,
        image: DecorationImage(
          colorFilter: isTransparent
              ? ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop)
              : null,
          image: const AssetImage("assets/images/logo.jpg"),
          fit: BoxFit.contain,
        ));
  }
}
