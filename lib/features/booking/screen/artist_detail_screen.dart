import 'package:flutter/material.dart';
import 'package:sixx_tattoo/app/constants.dart';
import 'package:sixx_tattoo/models/artist.dart';

class ArtistDetailScreen extends StatelessWidget {
  const ArtistDetailScreen({super.key});

  static const routeName = '/artist-detail';

  @override
  Widget build(BuildContext context) {
    final Artist artist = ModalRoute.of(context)!.settings.arguments as Artist;
    bool isScreenBig = MediaQuery.of(context).size.width >= 480;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: SixxColors.primary,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            expandedHeight: isScreenBig ? 800 : 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: artist.name,
                child: Image(
                  image: artist.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      artist.name,
                      style: const TextStyle(
                        color: SixxColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      width: double.infinity,
                      child: const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n'
                        'sed do eiusmod tempor incididunt ut labore et dolore magna\n'
                        'aliqua. Ut enim ad minim veniam, quis nostrud exercitation\n'
                        'ullamco laboris nisi ut aliquip ex ea commodo consequat.\n'
                        'Duis aute irure dolor in reprehenderit in voluptate velit\n'
                        'esse cillum dolore eu fugiat nulla pariatur.\n'
                        'Excepteur sint occaecat cupidatat non proident, sunt in culpa\n'
                        'qui officia deserunt mollit anim id est laborum.',
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(color: SixxColors.secondary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
