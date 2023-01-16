import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app/constants.dart';
import '../widgets/background_image.dart';

class HomeScreen extends StatelessWidget {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  bool isScreenBig(BuildContext context) =>
      MediaQuery.of(context).size.width >= 500;

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration:
            BackgroundImage(isTransparent: false).backgroundDecoration(),
        child: isScreenBig(context)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      //
                      InkWell(
                        onTap: () => launchUrl(Constants.googleUri),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'Location ',
                                  style: TextStyle(
                                    color: SixxColors.primary,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.location_on,
                                  color: SixxColors.primary,
                                )
                              ],
                            ),
                            const Text(
                              Constants.adress,
                              style: TextStyle(
                                  color: SixxColors.secondary, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Contact ',
                                style: TextStyle(
                                  color: SixxColors.primary,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.phone,
                                color: SixxColors.primary,
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () =>
                                _makePhoneCall(Constants.artist['number']!),
                            child: Text(
                              Constants.artist['name']!,
                              style: const TextStyle(
                                  color: SixxColors.secondary, fontSize: 16),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            Constants.artist2['name']!,
                            style: const TextStyle(
                                color: SixxColors.backGround, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 8,
                          )
                        ],
                      ),
                      const SizedBox()
                    ],
                  ),
                ],
              )
            : Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                const Text(
                  'Location:',
                  style: TextStyle(
                    color: SixxColors.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  Constants.adress,
                  style: TextStyle(color: SixxColors.secondary, fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  children: const [
                    Text(
                      'Contact:',
                      style: TextStyle(
                        color: SixxColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'John doe, 070-000-000-00',
                      style:
                          TextStyle(color: SixxColors.secondary, fontSize: 16),
                    ),
                    Text(
                      'Jane doe, 070-000-000-00',
                      style:
                          TextStyle(color: SixxColors.secondary, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                )
              ]));
  }
}
