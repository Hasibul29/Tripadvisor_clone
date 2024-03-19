import 'package:flutter/material.dart';
import '../constants.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.topItemTitle});

  final String? topItemTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: Border(
          bottom: BorderSide(width: 0, color: kPrimaryColor.withOpacity(0.5)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left_rounded,
            size: 30,
          ),
        ),
        leadingWidth: 40,
        titleSpacing: 0,
        title: Container(
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
          child: const Row(
            children: [
              Icon(Icons.search),
              SizedBox(width: kDefaultPadding * 0.3),
              Expanded(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: "Where to?", border: InputBorder.none),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kDefaultPadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: LocationListTile(
                imagePath: "assets/images/image1.jpg",
                title: topItemTitle ?? "Nearby",
                onPressed: () {},
              ),
            ),
            const SizedBox(height: kDefaultPadding * 0.5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text(
                "POPULAR DESTINATION",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: kDefaultPadding * 1.5),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: ((context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: LocationListTile(
                    imagePath: "assets/images/image1.jpg",
                    title: "FORM Hotel Dubai",
                    location: "Dubai, United Arab Emirates",
                    onPressed: () {},
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationListTile extends StatelessWidget {
  const LocationListTile({
    super.key,
    required this.title,
    this.location,
    required this.imagePath,
    required this.onPressed,
  });
  final String title;
  final String? location;
  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            height: 80,
            // padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        imagePath,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: kDefaultPadding),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      location != null
                          ? Text(
                              location!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.5),
                                  ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: kDefaultPadding),
      ],
    );
  }
}
