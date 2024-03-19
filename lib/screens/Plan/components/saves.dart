import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../controller/signin_controller.dart';
import '../../signin_signup.dart';

class Saves extends StatelessWidget {
  const Saves({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          const Text("No saves yet"),
          const SizedBox(height: kDefaultPadding),
          const Text("Places you save will appear here"),
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

