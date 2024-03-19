import 'package:flutter/material.dart';
import 'package:tripadvisor/constants.dart';

import 'buttons/custom_outlined_button.dart';

class CardType3 extends StatelessWidget {
  const CardType3({
    super.key,
    this.icon,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });
  final Widget? icon;
  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.tertiary,
      ),
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.surface,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: kDefaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: CustomOutlinedButton(
                icon: icon,
                text: buttonText,
                color: Colors.white,
                normalHeight: true,
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
