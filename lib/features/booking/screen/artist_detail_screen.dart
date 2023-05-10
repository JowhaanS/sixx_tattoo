import 'package:flutter/material.dart';
import 'package:sixx_tattoo/models/artist.dart';

class ArtistDetailScreen extends StatelessWidget {
  ArtistDetailScreen({super.key});

  static const routeName = '/artist-detail';

  @override
  Widget build(BuildContext context) {
    final Artist artist = ModalRoute.of(context)!.settings.arguments as Artist;
    return Scaffold(
      body: Center(child: Text(artist.name)),
    );
  }
}
