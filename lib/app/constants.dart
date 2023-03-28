import 'package:flutter/material.dart';

enum Navigation { home, gallery, booking, add, login }

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

class CustomSnackbar {
  static const snackBarInvalidPin = SnackBar(
    backgroundColor: SixxColors.primary,
    content: Text(
        textAlign: TextAlign.center,
        'Fel pinkod, vänligen försök igen!',
        style: TextStyle(
          color: SixxColors.secondary,
        )),
  );
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
