import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../controller/signin_controller.dart';
import '../../signin_signup.dart';

class Trips extends StatelessWidget {
  const Trips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const TripsBodyElement(
              icon: Icon(Icons.add_location_alt_outlined),
              text: "Get Personalized recs with AI"),
          const SizedBox(height: kDefaultPadding),
          const TripsBodyElement(
              icon: Icon(Icons.favorite_border_outlined),
              text: "Save hotels, restaurants, and more"),
          const SizedBox(height: kDefaultPadding),
          const TripsBodyElement(
              icon: Icon(Icons.map_outlined),
              text: "See your saves on your custom map"),
          const SizedBox(height: kDefaultPadding),
          const TripsBodyElement(
              icon: Icon(Icons.people_outline),
              text: "Share and collab with your travel buds"),
          const SizedBox(height: kDefaultPadding * 2),
          FilledButton(
            onPressed: () {},
            style:
                FilledButton.styleFrom(minimumSize: const Size.fromHeight(55)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add),
                SizedBox(width: kDefaultPadding * 0.4),
                Text("Create a trip")
              ],
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: Colors.purple.shade100,
              minimumSize: const Size.fromHeight(55),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_location_alt_outlined, color: Colors.black),
                SizedBox(width: kDefaultPadding * 0.4),
                Text("Build a trip with AI",
                    style: TextStyle(color: Colors.black))
              ],
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          !context.read<SignInController>().isSignedIn
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupOrSignin()),
                    );
                  },
                  child: Text(
                    "Login to access your Trips",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class TripsBodyElement extends StatelessWidget {
  const TripsBodyElement({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(kDefaultPadding * 0.4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
            ),
          ),
          child: icon,
        ),
        const SizedBox(width: kDefaultPadding),
        Expanded(child: Text(text))
      ],
    );
  }
}