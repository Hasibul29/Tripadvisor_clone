import 'package:flutter/material.dart';
import 'package:tripadvisor/constants.dart';

class CardType1 extends StatelessWidget {
  const CardType1({
    super.key,
    required this.imagePath,
    required this.title,
    required this.type,
    required this.location,
    required this.onPressed,
    required this.onPressedFavorite,
    required this.rating,
  });
  final String imagePath;
  final String title;
  final String type;
  final String location;
  final double rating;
  final VoidCallback onPressed;
  final VoidCallback onPressedFavorite;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding * 0.3),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    RatingView(rating: rating),
                    const SizedBox(width: kDefaultPadding * 0.4),
                    const Text("4,300")
                  ],
                ),
                Text(type),
                Text(location)
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton.filled(
                style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.surface),
                icon: const Icon(Icons.favorite_border_outlined),
                color: Theme.of(context).colorScheme.onSurface,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingView extends StatelessWidget {
  final double rating;
  final int maxRating;
  final IconData filledIcon;
  final IconData halfFilledIcon;
  final IconData unfilledIcon;
  final double iconSize;
  final Color filledColor;
  final Color halfFilledColor;
  final Color unfilledColor;

  const RatingView({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.filledIcon = Icons.star,
    this.halfFilledIcon = Icons.star_half,
    this.unfilledIcon = Icons.star_border,
    this.iconSize = 15.0,
    this.filledColor = kSecondaryColor,
    this.halfFilledColor = kSecondaryColor,
    this.unfilledColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    int filledStars = rating.floor();
    int halfStars = ((rating - filledStars) * 2).ceil();
    int unfilledStars = maxRating - filledStars - halfStars;

    return Row(
      children: List.generate(
            filledStars,
            (index) {
              return Icon(
                filledIcon,
                size: iconSize,
                color: filledColor,
              );
            },
          ) +
          List.generate(
            halfStars,
            (index) {
              return Icon(
                halfFilledIcon,
                size: iconSize,
                color: halfFilledColor,
              );
            },
          ) +
          List.generate(
            unfilledStars,
            (index) {
              return Icon(
                unfilledIcon,
                size: iconSize,
                color: unfilledColor,
              );
            },
          ),
    );
  }
}
