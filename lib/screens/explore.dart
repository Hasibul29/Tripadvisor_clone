import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripadvisor/constants.dart';
import 'package:tripadvisor/screens/AITrips/ai_trip.dart';
import 'package:tripadvisor/screens/search_widget.dart';
import 'package:tripadvisor/screens/signin_signup.dart';

import '../common/card_type_1.dart';
import '../common/buttons/custom_filled_button.dart';
import '../common/card_type_2.dart';
import '../common/card_type_3.dart';
import '../common/container_with_bg.dart';
import '../common/heading_widget.dart';
import '../controller/signin_controller.dart';
import 'Blog/Components/blog_body.dart';
import 'place_info.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 280,
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 1.2,
                vertical: kDefaultPadding * 0.6),
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            child: const TopSection(),
          ),
          const SizedBox(height: kDefaultPadding),
          ContainerWithBgImage(
            path: "assets/images/image2.jpg",
            text1: "Build a trip in minutes with AI",
            text2:
                "Kick-start your travel planning with a custom itinearary, guide by reviews.",
            buttonText: "Try it",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AiTrip()),
              );
            },
          ),
          const SizedBox(height: kDefaultPadding * 2),
          ContainerWithBgImage(
            path: "assets/images/image1.jpg",
            text1: "The scoop on cherry blossom season in D.C.",
            text2: "From the best time to visit to must-see places and more",
            buttonText: "Check it out",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BlogBody()));
            },
          ),
          const SizedBox(height: kDefaultPadding * 2),
          const HeadingWidget(
              heading: "Bring on the beach",
              body: "Family-friendly spots to catch some sun"),
          const SizedBox(height: kDefaultPadding * 0.5),
          SizedBox(
            height: 260,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.7),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 200,
                  child: CardType1(
                    imagePath: "assets/images/image1.jpg",
                    title: "Kailua Beach Park",
                    type: "Beaches",
                    location: "Kailua, Hawaii",
                    rating: 3.5,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlaceInfo()));
                    },
                    onPressedFavorite: () {},
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: kDefaultPadding * 2),
          const HeadingWidget(
              heading: "You're getting warmer",
              body: "Trips that will take you closer to the equator"),
          const SizedBox(height: kDefaultPadding * 0.5),
          SizedBox(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.7),
              itemBuilder: (BuildContext context, int index) {
                return const CardType2(
                  imagePath: "assets/images/image1.jpg",
                  text: "Costa Rica",
                );
              },
            ),
          ),
          const SizedBox(height: kDefaultPadding * 2),
          ContainerWithBgImage(
            path: "assets/images/image2.jpg",
            text1: "Your spring break plans, handled",
            text2: "Party all night or do something low-key--we've got recs",
            buttonText: "Let's go",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BlogBody()));
            },
          ),
          const SizedBox(height: kDefaultPadding * 2),
          const HeadingWidget(
              heading: "Yes, this is also wine country",
              body: "Raise a glass to these lesser-known regions"),
          const SizedBox(height: kDefaultPadding),
          SizedBox(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.7),
              itemBuilder: (BuildContext context, int index) {
                return const CardType2(
                  imagePath: "assets/images/image1.jpg",
                  text: "Finger Lakes",
                );
              },
            ),
          ),
          const SizedBox(height: kDefaultPadding * 2),
          ContainerWithBgImage(
            path: "assets/images/image2.jpg",
            text1: "Eat your way around Key West",
            text2: "An insider shares the spots (and dishes) you can't miss",
            buttonText: "Dig in",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BlogBody()));
            },
          ),
          const SizedBox(height: kDefaultPadding * 2),
          const HeadingWidget(
              heading: "Portugal, here we come",
              body: "Must-do experience, tours, and more"),
          const SizedBox(height: kDefaultPadding * 0.5),
          SizedBox(
            height: 300,
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.7),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 200,
                  child: CardType1(
                    imagePath: "assets/images/image1.jpg",
                    title:
                        "Sintra and Cascais Small-Group Day Trip from Lisbon",
                    type: "Full-day Tours",
                    location: "Lisbon",
                    rating: 3.5,
                    onPressed: () {},
                    onPressedFavorite: () {},
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: kDefaultPadding * 2),
          CardType3(
            icon: Icon(
              Icons.add_location_alt_outlined,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            text: "Is Tripadvisor missing a place?",
            buttonText: "Add a missing place",
            onPressed: () {},
          ),
          const SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
              onPressed: () {
                if (!context.read<SignInController>().isSignedIn) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupOrSignin()),
                  );
                }
              },
              icon: const Icon(
                Icons.account_circle_rounded,
                size: 50,
              )),
        ),
        Text(
          "Explore",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: kDefaultPadding),
        Row(
          children: [
            CustomFilledButton(
              icon: Icons.bed_outlined,
              text: "Hotels",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const SearchWidget(topItemTitle: "Hotels nearby")),
                );
              },
            ),
            const SizedBox(width: kDefaultPadding * 0.4),
            CustomFilledButton(
              icon: Icons.confirmation_num_outlined,
              text: "Things to do",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchWidget(
                          topItemTitle: "Things to do nearby")),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: kDefaultPadding * 0.4),
        Row(
          children: [
            CustomFilledButton(
              icon: Icons.restaurant_menu_outlined,
              text: "Restaurant",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchWidget(
                          topItemTitle: "Restaurant nearby")),
                );
              },
            ),
            const SizedBox(width: kDefaultPadding * 0.4),
            CustomFilledButton(
              icon: Icons.forum_outlined,
              text: "Forums",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const SearchWidget(topItemTitle: "Forums Home")),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
