import 'package:flutter/material.dart';

enum Navigation { home, gallery, booking, add, login }

enum FilterOptions { all, christian, emanuel, christianStencil, emanuelStencil }

class Constants {
  static const artist = {'name': 'Christian', 'number': '+46761484739'};
  static const artist2 = {'name': 'Emanuel', 'number': '+46701598058'};
  static const String adress = 'Bangårdsgatan 2, 534 30 Vara';
  static final Uri googleUriApple = Uri.parse(
      'https://maps.apple.com/?address=Bang%C3%A5rdsgatan%202,%20534%2030%20Vara,%20Sweden&ll=58.260833,12.950231&q=Bang%C3%A5rdsgatan%202');
  static final Uri googleUriAndroid =
      Uri.parse('https://goo.gl/maps/SRmZi9KP1FVbA9gDA');
}

class SixxColors {
  static const Color primary = Color.fromARGB(255, 88, 168, 174);
  static const Color secondary = Color.fromARGB(255, 218, 229, 221);
  static const Color backGround = Color.fromARGB(255, 29, 29, 29);
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class CustomSnackbar {
  static const snackBarUploadSuccess = SnackBar(
    content: Text(
      'Image uploaded successfully!',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: SixxColors.secondary,
      ),
    ),
    backgroundColor: SixxColors.primary,
  );
}
