import 'package:flutter/material.dart';

import '../common/card_type_1.dart';
import '../common/image_gallery.dart';
import '../constants.dart';

class PlaceInfo extends StatelessWidget {
  const PlaceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(width: 0, color: kPrimaryColor.withOpacity(0.1)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left_rounded, size: 35),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
          const SizedBox(width: kDefaultPadding * 0.5),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          ),
          const SizedBox(width: kDefaultPadding * 0.5),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ImageGallery(
                          name: "Kailua Beach Park",
                          imagePath:
                              "https://source.unsplash.com/random/?kailua-beach-park")));
            },
            child: SizedBox(
              height: 400,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  physics: const PageScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TopImage(
                      imagePath:
                          "https://source.unsplash.com/random/?kailua-beach-park&index=$index",
                      index: index,
                      length: 100,
                    );
                  }),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kailua Beach Park",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Row(
                  children: [
                    RatingView(rating: 4.5, iconSize: 20),
                    SizedBox(width: kDefaultPadding * 0.5),
                    Text(
                      "3,066 reviews",
                      style: TextStyle(decoration: TextDecoration.underline),
                    )
                  ],
                ),
                const SizedBox(height: kDefaultPadding * 0.4),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(text: "#1 of 21 things to do in "),
                  TextSpan(
                      text: "Kailua",
                      style: TextStyle(decoration: TextDecoration.underline)),
                ])),
                const SizedBox(height: kDefaultPadding),
                const Text("Beaches"),
                const SizedBox(height: kDefaultPadding),
                const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ullamcorper ante in eros posuere condimentum. Quisque quis faucibus elit."),
                const SizedBox(height: kDefaultPadding),
                Text(
                  "Explore the area",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: kDefaultPadding),
                const Text("Address"),
                const SizedBox(height: kDefaultPadding * 0.3),
                const Text(
                  "526 Kawailoa Road, Kailua, Oahu, Hi 96734",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class TopImage extends StatelessWidget {
  const TopImage({
    super.key,
    required this.imagePath,
    required this.index,
    required this.length,
  });
  final String imagePath;
  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: NetworkImage(imagePath))),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.5),
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black),
          child: Text(
            "${index + 1}/${length}+",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
