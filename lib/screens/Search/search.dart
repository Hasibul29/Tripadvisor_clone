import 'package:flutter/material.dart';
import 'package:tripadvisor/common/card_type_2.dart';
import 'package:tripadvisor/common/card_type_3.dart';

import '../../common/card_type_1.dart';
import '../../constants.dart';
import '../place_info.dart';
import '../search_widget.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: kDefaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
            child: Text(
              "Search",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.8),
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              children: [
                const Icon(Icons.search),
                const SizedBox(width: kDefaultPadding * 0.3),
                Expanded(
                  child: TextField(
                    readOnly: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchWidget()),
                      );
                    },
                    decoration: const InputDecoration(
                        hintText: "Where to?", border: InputBorder.none),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: kDefaultPadding * 2),
          CardType3(
            text: "See what's good nearby",
            buttonText: "Turn on location settings",
            onPressed: () {},
          ),
          const SizedBox(height: kDefaultPadding * 2),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.8),
            child: Text(
              "Top experience on\nTripadvisor",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
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
          const SizedBox(height: kDefaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.8),
            child: Text(
              "Destinations travelers love",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: GridView.count(
              crossAxisSpacing: kDefaultPadding * 0.2,
              mainAxisSpacing: kDefaultPadding * 0.6,
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                CardType2(
                    imagePath: "assets/images/image2.jpg",
                    text: "New York City"),
                CardType2(
                    imagePath: "assets/images/image1.jpg",
                    text: "New York City"),
                CardType2(
                    imagePath: "assets/images/image1.jpg",
                    text: "New York City"),
                CardType2(
                    imagePath: "assets/images/image2.jpg",
                    text: "New York City"),
              ],
            ),
          ),
          const SizedBox(height: kDefaultPadding * 2),
        ],
      ),
    );
  }
}
