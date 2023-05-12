import 'package:flutter/material.dart';
import 'package:sixx_tattoo/app/constants.dart';
import 'package:sixx_tattoo/features/booking/widgets/booking_card.dart';
import 'package:sixx_tattoo/models/artist.dart';

import '../../../widgets/background_image.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isScreenBig = MediaQuery.of(context).size.width >= 480;
    return Stack(children: [
      Container(
        decoration: BackgroundImage(isTransparent: true).backgroundDecoration(),
        child: isScreenBig
            ? SizedBox(
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BookingCard(
                      artist: Artist(
                        name: Constants.artist['name']!,
                        number: Constants.artist['number']!,
                        image:
                            const AssetImage('assets/images/placeholder.jpeg'),
                      ),
                    ),
                    const VerticalDivider(
                      thickness: 6,
                      width: 6,
                      color: SixxColors.primary,
                    ),
                    BookingCard(
                      artist: Artist(
                        name: Constants.artist2['name']!,
                        number: Constants.artist2['number']!,
                        image:
                            const AssetImage('assets/images/placeholder.jpeg'),
                      ),
                    )
                  ],
                ),
              )
            : Column(
                children: [
                  BookingCard(
                    artist: Artist(
                      name: Constants.artist['name']!,
                      number: Constants.artist['number']!,
                      image: const AssetImage('assets/images/placeholder.jpeg'),
                    ),
                  ),
                  BookingCard(
                    artist: Artist(
                      name: Constants.artist2['name']!,
                      number: Constants.artist2['number']!,
                      image: const AssetImage('assets/images/placeholder.jpeg'),
                    ),
                  ),
                ],
              ),
      ),
    ]);
  }
}
