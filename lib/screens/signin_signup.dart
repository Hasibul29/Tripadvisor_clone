import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tripadvisor/screens/location_permission.dart';

import '../common/buttons/custom_outlined_button.dart';
import '../constants.dart';
import '../controller/signin_controller.dart';

class SignupOrSignin extends StatelessWidget {
  const SignupOrSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kDefaultPadding),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LocationPermission()),
                        );
                      },
                      child: Text(
                        "Skip",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ))),
              const SizedBox(height: kDefaultPadding),
              const Icon(
                Icons.circle,
                size: 80,
                color: kSecondaryColor,
              ),
              const SizedBox(height: kDefaultPadding),
              Text(
                "Sign in to start planning your trip.",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: kDefaultPadding),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'By proceeding, you agree to our ',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.8),
                          ),
                    ),
                    TextSpan(
                      text: 'Terms of Use',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(
                      text: ' and confirm you have read our ',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6)),
                    ),
                    TextSpan(
                      text: 'Privacy and Cookie Statement',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    const TextSpan(
                      text: '.',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              CustomOutlinedButton(
                onPressed: () {
                  context.read<SignInController>().setIsSignedIn(true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LocationPermission()),
                  );
                },
                text: "Continue with Google",
                icon: SvgPicture.asset(
                  'assets/icons/google.svg',
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              CustomOutlinedButton(
                  onPressed: () {
                    context.read<SignInController>().setIsSignedIn(true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LocationPermission()),
                    );
                  },
                  text: "Continue with Email",
                  icon: const Icon(Icons.mail_outline)),
            ],
          ),
        ),
      ),
    );
  }
}
