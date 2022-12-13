import 'package:flutter/material.dart';

import '../widgets/background_image.dart';

class HomeScreen extends StatelessWidget {
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
                      Column(
                        children: const [
                          Text(
                            'Location:',
                            style: TextStyle(
                              color: Color.fromARGB(255, 88, 168, 174),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Adress with google maps link',
                            style: TextStyle(
                                color: Color.fromARGB(255, 218, 229, 221),
                                fontSize: 16),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            'Contact:',
                            style: TextStyle(
                              color: Color.fromARGB(255, 88, 168, 174),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'John doe, 070-000-000-00',
                            style: TextStyle(
                                color: Color.fromARGB(255, 218, 229, 221),
                                fontSize: 16),
                          ),
                          Text(
                            'Jane doe, 070-000-000-00',
                            style: TextStyle(
                                color: Color.fromARGB(255, 218, 229, 221),
                                fontSize: 16),
                          ),
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
                    color: Color.fromARGB(255, 88, 168, 174),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Adress with google maps link',
                  style: TextStyle(
                      color: Color.fromARGB(255, 218, 229, 221), fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  children: const [
                    Text(
                      'Contact:',
                      style: TextStyle(
                        color: Color.fromARGB(255, 88, 168, 174),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'John doe, 070-000-000-00',
                      style: TextStyle(
                          color: Color.fromARGB(255, 218, 229, 221),
                          fontSize: 16),
                    ),
                    Text(
                      'Jane doe, 070-000-000-00',
                      style: TextStyle(
                          color: Color.fromARGB(255, 218, 229, 221),
                          fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                )
              ]));
  }
}
