import 'package:flutter/material.dart';
import 'package:tripadvisor/screens/Home/home.dart';

import '../constants.dart';

class LocationPermission extends StatelessWidget {
  const LocationPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 3),
              Icon(
                Icons.circle,
                size: 100,
                color: Colors.red.shade300,
              ),
              const Spacer(flex: 1),
              Text(
                "Discover traveler recommended spots near you, wherever you are.",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(flex: 4),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 55),
                ),
                child: const Text("Allow location data"),
              ),
              const Spacer(flex: 1),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    child: Text(
                      "Not now",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
