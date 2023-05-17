import 'package:flutter/material.dart';
import 'package:sixx_tattoo/features/booking/screen/artist_detail_screen.dart';
import 'package:sixx_tattoo/models/artist.dart';
import 'package:sixx_tattoo/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    required this.artist,
    super.key,
  });
  final Artist artist;

  Future<void> _makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: artist.number,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Opacity(
              opacity: 0.5,
              child: Card(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ArtistDetailScreen.routeName,
                      arguments: artist,
                    );
                  },
                  child: Hero(
                    tag: artist.name,
                    child: Image(
                      image: artist.image,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              artist.name,
              style: const TextStyle(
                color: Color.fromARGB(255, 218, 229, 221),
                fontSize: 36,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    title: 'Call and book!',
                    onTapped: () => _makePhoneCall(),
                  ),
                  CustomButton(
                    title: 'Book online!',
                    onTapped: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
