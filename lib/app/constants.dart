import 'package:flutter/material.dart';

enum Navigation { home, gallery, booking, add, login }

class Constants {
  static const artist = {'name': 'Christian', 'number': '+46761484739'};
  static const artist2 = {'name': 'Emanuel', 'number': '+4670000000'};
  static const String adress = 'Bangårdsgatan 2, 534 30 Vara';
  static final Uri googleUriApple = Uri.parse(
      'https://maps.apple.com/?address=Bang%C3%A5rdsgatan%202,%20534%2030%20Vara,%20Sweden&ll=58.260833,12.950231&q=Bang%C3%A5rdsgatan%202');
  static final Uri googleUriAndroid = Uri.parse(
      'https://www.google.com/maps/place/Sixx+tattoo+studio/@58.2607938,12.9502927,17z/data=!3m1!4b1!4m5!3m4!1s0x465acf12b11680df:0x1eadd778d3c3fc76!8m2!3d58.2608436!4d12.9504061');
}

class SixxColors {
  static const Color primary = Color.fromARGB(255, 88, 168, 174);
  static const Color secondary = Color.fromARGB(255, 218, 229, 221);
  static const Color backGround = Color.fromARGB(255, 29, 29, 29);
}

class CustomSnackbar {
  static const snackBarPhoneNumberEmpty = SnackBar(
    backgroundColor: SixxColors.primary,
    content: Text(
      textAlign: TextAlign.center,
      'Du måste ange ett telefonnummer!',
      style: TextStyle(
        color: SixxColors.secondary,
      ),
    ),
  );
  static const snackBarInvalidNumber = SnackBar(
    backgroundColor: SixxColors.primary,
    content: Text(
      textAlign: TextAlign.center,
      'Du måste ange ett giltligt telefonnummer!',
      style: TextStyle(
        color: SixxColors.secondary,
      ),
    ),
  );
  static const snackBarInvalidPin = SnackBar(
    backgroundColor: SixxColors.primary,
    content: Text(
        textAlign: TextAlign.center,
        'Fel pinkod, vänligen försök igen!',
        style: TextStyle(
          color: SixxColors.secondary,
        )),
  );
}
