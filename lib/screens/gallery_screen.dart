import 'package:booking_calendar/booking_calendar.dart';
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
    ]);
  }
}
