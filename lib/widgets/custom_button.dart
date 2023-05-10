import 'package:flutter/material.dart';
import 'package:sixx_tattoo/app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.onPressed,
    super.key,
  });
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          onPressed;
        },
        style: ElevatedButton.styleFrom(backgroundColor: SixxColors.primary),
        child: Text(
          title,
          style: const TextStyle(
            color: SixxColors.secondary,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
