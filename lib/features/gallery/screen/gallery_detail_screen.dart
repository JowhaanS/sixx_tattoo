import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixx_tattoo/app/constants.dart';
import 'package:sixx_tattoo/features/gallery/images_cubit/images_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class GalleryDetailScreen extends StatelessWidget {
  GalleryDetailScreen({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  late String? _authorName;
  static const routeName = '/image-detail';

  @override
  Widget build(BuildContext context) {
    final imageId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedImage = BlocProvider.of<ImagesCubit>(context).findById(imageId);

    if (loadedImage.author == Constants.artist['number']) {
      _authorName = Constants.artist['name'];
    } else if (loadedImage.author == Constants.artist2['number']) {
      _authorName = Constants.artist2['name'];
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 700,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: loadedImage.id,
                child: Image.network(
                  loadedImage.imageUrl,
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
                loadedImage.isStencil
                    ? Column(
                        children: [
                          Text(
                            'Om du är intresserad av denna hör av dig till\n $_authorName på:',
                            style: const TextStyle(
                              color: SixxColors.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              _makePhoneCall(loadedImage.author);
                            },
                            child: Text(
                              loadedImage.author,
                              style: const TextStyle(
                                color: SixxColors.secondary,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                            'Gjord av: $_authorName',
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
