import 'package:flutter/material.dart';

class BackgroundImage {
  BackgroundImage({required this.isTransparent});

  final bool isTransparent;

  BoxDecoration backgroundDecoration() {
    return BoxDecoration(
        color: const Color.fromARGB(255, 29, 29, 29),
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
